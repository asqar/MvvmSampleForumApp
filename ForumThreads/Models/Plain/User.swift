//
//  User.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation

struct User {
    
    var id: Int = 0
    var name: String!
    var username: String!
    var email: String!
    var address: Address!
    var phone: String!
    var website: String!
    var company: Company!
    
    init() { }
}
