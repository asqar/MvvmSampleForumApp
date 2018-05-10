//
//  SearchResultViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import SwiftFetchedResultsController
import RealmSwift

class SearchResultViewModel : FetchedResultsViewModel<RlmPost> {

    private var searchAttempt:RlmSearchAttempt!

    convenience init(searchAttemptViewModel:SearchAttemptViewModel!) {
        self.init(searchQuery:searchAttemptViewModel.queryString)
    }
    
    required init() {
        
    }

    init(searchQuery:String!) {
        super.init()

        self.realm().beginWrite()
        let searchAttempt:RlmSearchAttempt = RlmSearchAttempt()
        searchAttempt.searchTerm = searchQuery
        searchAttempt.dateSearched = Date()
        self.realm().add(searchAttempt, update: true)
        do {
            try self.realm().commitWrite()
        } catch let error {
            print(error)
        }
        self.searchAttempt = searchAttempt
    }
    
    override var title : String! {
        return searchAttempt.searchTerm
    }

    override var fetchRequest : FetchRequest<RlmPost>! {
        let sd1:SortDescriptor! = SortDescriptor(keyPath:"id", ascending:true)
        let sortDescriptors:[SortDescriptor]! = [ sd1 ]

        let fetchRequest:FetchRequest! = FetchRequest<RlmPost>(realm: self.realm(), predicate:nil)
        fetchRequest.predicate = NSPredicate(format:"searchAttempt.searchTerm == '\(self.searchAttempt.searchTerm!)'")
        fetchRequest.sortDescriptors = sortDescriptors
        return fetchRequest
    }

    override var serviceUrl : String! {
        let encodedStr:String! = self.searchAttempt.searchTerm.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlHostAllowed)
        return String(format:"text=%@", encodedStr)
    }

    override func processDownloadedResults(results:[RlmPost]) {
        self.realm().beginWrite()
        var orderIndex:Int = self.numberOfItemsInSection(section: 0) + 1
        for _:RlmPost in results {
//            item.orderIndex = orderIndex
//            item.searchAttempt = self.searchAttempt
            orderIndex += 1
        }
        do {
            try self.realm().commitWrite()
        } catch let error {
            print(error)
        }
    }

    override func objectAtIndexPath(indexPath:IndexPath!) -> BaseViewModel! {
        let post = self.fetchedResultsController.objectAtIndexPath(indexPath)
        return PostViewModel(post: Post.mapFromRealmObject(post!))
    }
}
