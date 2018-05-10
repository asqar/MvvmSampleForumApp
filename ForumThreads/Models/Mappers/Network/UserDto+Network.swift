//
//  UserDto+Network.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import ObjectMapper

extension UserDto: StaticMappable {
    
    static func objectForMapping(map: Map) -> BaseMappable? {
        return Cache.default.load(byPK: map.JSON["id"]) as UserDto
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

