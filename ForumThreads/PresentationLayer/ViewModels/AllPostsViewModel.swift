//
//  PopularFeedsViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 26.11.2017.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import ReactiveCocoa
import SwiftFetchedResultsController
import RealmSwift

class AllPostsViewModel : FetchedResultsViewModel<RlmPost> {

    override var title : String! {
        return "All Threads".localized
    }
    
    override var fetchRequest: FetchRequest<RlmPost>!
    {
        let sd1:SortDescriptor! = SortDescriptor(keyPath:"id", ascending:true)
        let sortDescriptors:[SortDescriptor]! = [ sd1 ]
        let fetchRequest:FetchRequest! = FetchRequest<RlmPost>(realm: self.realm(), predicate:nil)
        fetchRequest.sortDescriptors = sortDescriptors
        return fetchRequest
    }

    override var serviceUrl : String! {
        return ""
    }
    
    override func fetchData(updating:Bool)
    {
        NetworkService().fetchPosts(completion: self.completion())
    }
    
//    override func processDownloadedResults<T>(results: [T]) where T : Post {
//        for result in results {
//            let realmObject Post.mapToRealmObject(result)
//            
//        }
//    }

    override func objectAtIndexPath(indexPath:IndexPath!) -> PostViewModel! {
        let post:RlmPost = self.fetchedResultsController.objectAtIndexPath(indexPath)!
        return PostViewModel(post: Post.mapFromRealmObject(post))
    }
}
