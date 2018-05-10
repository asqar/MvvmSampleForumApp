//
//  Post.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation

struct Post {
    
    var userId: Int = 0
    var id: Int = 0
    var title: String!
    var body: String!
    var user: User!
    
    init() { }
    
}
