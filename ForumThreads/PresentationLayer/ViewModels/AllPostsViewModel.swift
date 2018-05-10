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
    
    override func processDownloadedResults(results: [Any]) {
        
        self.realm().beginWrite()
        
        let newItems = results.map { (i : Any) -> RlmPost in
            return (i as! Post).mapToRealmObject()
        }
        self.realm().add(newItems, update: true)

        do {
            try self.realm().commitWrite()
        } catch let error {
            print(error)
        }
        
        for i in results {
            var item = i as! Post
            if item.user == nil
            {
                NetworkService().fetchUser(id: item.userId, completion: { (resultUser) in
                    
                    let user = resultUser.value
                    item.user = user
                    
                    self.assignPostAuthor(user: user!, post: item)
                })
            }
        }
    }

    override func objectAtIndexPath(indexPath:IndexPath!) -> PostViewModel! {
        let post:RlmPost = self.fetchedResultsController.objectAtIndexPath(indexPath)!
        return PostViewModel(post: Post.mapFromRealmObject(post))
    }
    
    func assignPostAuthor(user: User, post: Post)
    {
        let realmUser = user.mapToRealmObject()
        let realmPost = post.mapToRealmObject()
        
        self.realm().beginWrite()
        
        self.realm().add(realmUser, update: true)
        realmPost.user = realmUser
        
        do {
            try self.realm().commitWrite()
        } catch let error {
            print(error)
        }
    }
}
