//
//  RlmUser.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation

class RlmUser : RlmEntity {

    @objc dynamic var name: String!
    @objc dynamic var username: String!
    @objc dynamic var email: String!
    @objc dynamic var phone: String!
    @objc dynamic var website: String!
    
    var address: Address!
    var company: Company!
    
}
