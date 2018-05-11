//
//  PostCommentsViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 11.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import SwiftFetchedResultsController
import RealmSwift

class PostCommentsViewModel: FetchedResultsViewModel<RlmComment> {
    
    private(set) var post:PostDto!
    
    init(post:PostDto!) {
        self.post = post
        super.init()
    }
    
    required init() {
    }
    
    typealias RealmType = RlmComment
    
    override var title : String! {
        return "Comments".localized
    }
    
    override var fetchRequest: FetchRequest<RealmType>!
    {
        let sd1:SortDescriptor! = SortDescriptor(keyPath:"id", ascending:true)
        let sortDescriptors:[SortDescriptor]! = [ sd1 ]
        let fetchRequest:FetchRequest! = FetchRequest<RealmType>(realm: self.realm(), predicate:nil)
        fetchRequest.sortDescriptors = sortDescriptors
        return fetchRequest
    }
    
    override var serviceUrl : String! {
        return ""
    }
    
    override func fetchData(updating:Bool)
    {
        CachedNetworkService().fetchComments(post: self.post.mapToRealmObject(), completion: self.completion())
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
    
    override func objectAtIndexPath(indexPath:IndexPath!) -> CommentViewModel! {
        let comment:RealmType = self.fetchedResultsController.objectAtIndexPath(indexPath)!
        return CommentViewModel(comment: CommentDto.mapFromRealmObject(comment))
    }
}
