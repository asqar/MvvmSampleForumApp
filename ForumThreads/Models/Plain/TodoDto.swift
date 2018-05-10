//
//  TodoDto.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation

struct TodoDto {
    
    var userId: Int = 0
    var id: Int = 0
    var title: String!
    var completed: Bool = false
    
    init() { }
}
