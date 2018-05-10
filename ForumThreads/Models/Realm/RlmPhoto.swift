//
//  Photo.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import RealmSwift
import ObjectMapper
import ObjectMapper_Realm

class RlmPhoto : RlmEntity, Mappable {
    @objc dynamic var albumId: Int = 0
    @objc dynamic var title: String!
    @objc dynamic var url: String!
    @objc dynamic var thumbnailUrl: String!
    
    @objc dynamic var album:RlmAlbum!
    
    // MARK: - Mapping directly from JSON
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        albumId <- map["albumId"]
        id <- map["id"]
        title <- map["title"]
        url <- map["url"]
        thumbnailUrl <- map["thumbnailUrl"]
    }
}
