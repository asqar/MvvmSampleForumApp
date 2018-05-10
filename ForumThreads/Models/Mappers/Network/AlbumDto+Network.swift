//
//  Album+Network.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import ObjectMapper

extension AlbumDto: StaticMappable {
    
    static func objectForMapping(map: Map) -> BaseMappable? {
        return Cache.default.load(byPK: map.JSON["id"]) as AlbumDto
    }
    
    mutating func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
    }
    
}

