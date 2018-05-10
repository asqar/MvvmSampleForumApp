//
//  FeedImageViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 03.12.2017.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import ReactiveCocoa

class PostViewModel : BaseViewModel {
    private(set) var post:PostDto {
        didSet {
            (self.updatedContentSignal as! RACSubject).sendNext({ (x:Any!) in })
        }
    }
    
    var user : UserDto = UserDto() {
        didSet {
            (self.updatedContentSignal as! RACSubject).sendNext({ (x:Any!) in })
        }
    }
    
    init(post:PostDto!) {
        self.post = post
        super.init()
        
        if post.user == nil {
            self.lazyLoadById(id: post.userId)
        }
    }
    
    func lazyLoadById(id: Int) {
        let found = UserDto.objectById(id: id)
        if found?.id != 0
        {
            self.user = found!
        } else {
            CachedNetworkService().fetchUser(id: id) { (resultUser) in
                resultUser.withValue({ (rlmUser) in
                    self.user = UserDto.mapFromRealmObject(rlmUser)
                    
                    do {
                        try self.realm().write {
                            self.realm().add(rlmUser, update: true)
                        }
                    } catch let error {
                        print(error)
                    }

                })
            }
        }
    }
}
