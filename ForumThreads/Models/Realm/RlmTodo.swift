//
//  RlmTodo.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation

class RlmTodo : RlmEntity {
    
    @objc dynamic var userId: Int = 0
    @objc dynamic var title: String!
    @objc dynamic var completed: Bool = false
    
}
