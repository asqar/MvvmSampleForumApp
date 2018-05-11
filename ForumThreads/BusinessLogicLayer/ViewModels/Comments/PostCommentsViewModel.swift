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
    
    override var serviceUrl : String! {
        return ""
    }
    
    override var fieldsToSearch: [String] { get { return ["name", "body"] } }
    
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
    
    func createNewComment() -> NewCommentViewModel! {
        var comment = CommentDto()
        comment.postId = post.id
        #if DEBUG
        comment.name = "Askar Bakirov"
        comment.email = "askar@bakirov.kz"
        comment.body = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        #endif
        return NewCommentViewModel(comment: comment)
    }
}
