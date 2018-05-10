//
//  RlmComment.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RealmSwift

class RlmComment : RlmEntity {
    
    @objc dynamic var postId: Int = 0
    @objc dynamic var name: String!
    @objc dynamic var email: String!
    @objc dynamic var body: String!
    
    @objc dynamic var post:RlmPost!
}
