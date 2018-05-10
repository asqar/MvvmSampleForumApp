//
//  Album+Realm.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RealmSwift


extension AlbumDto: RealmMappableProtocol {
    
    typealias RealmType = RlmAlbum
    
    static func mapFromRealmObject(_ object: RealmType) -> AlbumDto {
        var model = AlbumDto()
        
        model.userId = object.userId
        model.id = object.id
        model.title = object.title
        
        return model
    }
    
    func mapToRealmObject() -> RealmType {
        let model = RealmType()
        
        model.userId = userId
        model.id = id
        model.title = title
        
        return model
    }
    
}

