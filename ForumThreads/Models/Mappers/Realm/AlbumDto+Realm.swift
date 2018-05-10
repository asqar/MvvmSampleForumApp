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
    
    static func mapFromRealmObject(_ object: RlmAlbum) -> AlbumDto {
        var model = AlbumDto()
        
        model.userId = object.userId
        model.id = object.id
        model.title = object.title
        
        return model
    }
    
    func mapToRealmObject() -> RlmAlbum {
        let model = RlmAlbum()
        
        model.userId = userId
        model.id = id
        model.title = title
        
        return model
    }
    
}
