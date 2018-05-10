//
//  RlmComment.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm

class RlmComment : RlmEntity, Mappable {
    
    @objc dynamic var postId: Int = 0
    @objc dynamic var name: String!
    @objc dynamic var email: String!
    @objc dynamic var body: String!
    
    @objc dynamic var post:RlmPost!
    
    // MARK: - Mapping directly from JSON
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        postId <- map["postId"]
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        body <- map["body"]
    }
}
