//
//  PostListViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import ReactiveCocoa
import SwiftFetchedResultsController
import RealmSwift

class PostListViewModel : FetchedResultsViewModel<RlmPost> {

    typealias RealmType = RlmPost
    
    override var title : String! {
        return "Posts".localized
    }
    
    override var fieldsToSearch: [String] { get { return ["title", "body"] } }
    
    override func sortDescriptors() -> [SortDescriptor]! {
        return [ SortDescriptor(keyPath:"id", ascending:true) ]
    }

    override var serviceUrl : String! {
        return ""
    }
    
    override func fetchData(updating:Bool)
    {
        CachedNetworkService().fetchPosts(completion: self.completion())
    }
    
    override func processDownloadedResults(results: [RealmType]) {

        do {
            try self.realm().write {
                self.realm().add(results, update: true)
            }
        } catch let error {
            print(error)
        }
    }

    override func objectAtIndexPath(indexPath:IndexPath!) -> PostViewModel! {
        let post:RealmType = self.fetchedResultsController.objectAtIndexPath(indexPath)!
        return PostViewModel(post: PostDto.mapFromRealmObject(post))
    }
    
    override func selectObjectAtIndexPath(indexPath: IndexPath!) -> BaseViewModel! {
        let post:RealmType = self.fetchedResultsController.objectAtIndexPath(indexPath)!
        return PostCommentsViewModel(post: PostDto.mapFromRealmObject(post))
    }
}
