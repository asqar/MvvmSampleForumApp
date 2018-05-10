//
//  UserDto+Network.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import ObjectMapper

extension UserDto: StaticMappable {
        
    static func objectById(id: Int) -> UserDto? {
        return Cache.default.load(byPK: id) as UserDto
    }
    
    static func objectForMapping(map: Map) -> BaseMappable? {
        return objectById(id: map.JSON["id"] as! Int)
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        username <- map["username"]
        email <- map["email"]
        address <- map["address"]
        phone <- map["phone"]
        website <- map["website"]
        company <- map["company"]
    }
    
}

