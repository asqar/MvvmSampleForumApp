//
//  RlmAlbum.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import ObjectMapper
import ObjectMapper_Realm

class RlmAlbum : RlmEntity, Mappable {
    
    @objc dynamic var userId:Int = 0
    @objc dynamic var title: String!
    
    @objc dynamic var user:RlmUser!
    
    // MARK: - Mapping directly from JSON
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
    }
}
