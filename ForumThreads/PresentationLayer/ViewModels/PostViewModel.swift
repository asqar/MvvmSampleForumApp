//
//  FeedImageViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 03.12.2017.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation

class PostViewModel : BaseViewModel {
    private(set) var post:Post
    
    init(post:Post!) {
        self.post = post
        super.init()
    }
}
