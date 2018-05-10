//
//  CommentDto.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation

struct CommentDto {
    
    var postId: Int = 0
    var id: Int = 0
    var name: String!
    var email: String!
    var body: String!
    
    init() { }
    
}
