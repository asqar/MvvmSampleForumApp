//
//  NewPostViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import ReactiveCocoa

class NewPostViewModel : BaseViewModel {
    
    var isSaved:Bool {
        get {
            return self.post.id != 0
        }
    }
    
    var post:PostDto! {
        didSet {
            (self.updatedContentSignal as! RACSubject).sendNext(nil)
        }
    }
    
    init(post:PostDto!) {
        self.post = post
        super.init()
    }
    
    func send(){
        CachedNetworkService().createPost(post: post) { (resultPost) in
            resultPost.withValue({ (rlmPost) in
                self.post = PostDto.mapFromRealmObject(rlmPost)
                
                do {
                    try self.realm().write {
                        self.realm().add(rlmPost, update: true)
                    }
                } catch let error {
                    print(error)
                }
                
            })
        }
    }
}

