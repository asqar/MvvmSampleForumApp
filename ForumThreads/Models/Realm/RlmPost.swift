//
//  RlmPost.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm

class RlmPost : RlmEntity, Mappable {
    
    @objc dynamic var userId:Int = 0
    @objc dynamic var title: String!
    @objc dynamic var body: String!
    @objc dynamic var searchAttempt:RlmSearchAttempt!
    
    @objc dynamic var user:RlmUser!
    
    // MARK: - Mapping directly from JSON
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }
}

