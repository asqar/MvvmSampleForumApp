//
//  Post+Realm.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RealmSwift

extension PostDto: RealmMappableProtocol {
    
    typealias RealmType = RlmPost
    
    static func mapFromRealmObject(_ object: RealmType) -> PostDto {
        var model = PostDto()
        
        model.userId = object.userId
        model.id = object.id
        model.title = object.title
        model.body = object.body
        
        return model
    }
    
    func mapToRealmObject() -> RealmType {
        let model = RealmType()
        
        model.userId = userId
        model.id = id
        model.title = title
        model.body = body
        
//        if user != nil {
//            model.user = user.mapToRealmObject()
//        }
        
        return model
    }
    
}

