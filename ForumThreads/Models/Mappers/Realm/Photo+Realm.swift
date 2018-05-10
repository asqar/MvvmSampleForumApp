//
//  Photo+Realm.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RealmSwift


extension Photo: RealmMappableProtocol {
    
    static func mapFromRealmObject(_ object: RlmPhoto) -> Photo {
        var model = Photo()
        
        model.albumId = object.albumId
        model.id = object.id
        model.title = object.title
        model.url = object.url
        model.thumbnailUrl = object.thumbnailUrl
        
        return model
    }
    
    func mapToRealmObject() -> RlmPhoto {
        let model = RlmPhoto()
        
        model.albumId = albumId
        model.id = id
        model.title = title
        model.url = url
        model.thumbnailUrl = thumbnailUrl
        
        return model
    }
    
}

