//
//  Comment+Realm.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RealmSwift


extension CommentDto: RealmMappableProtocol {
    
    typealias RealmType = RlmComment
    
    static func mapFromRealmObject(_ object: RealmType) -> CommentDto {
        var model = CommentDto()
        
        model.postId = object.postId
        model.id = object.id
        model.name = object.name
        model.email = object.email
        model.body = object.body
        
        return model
    }
    
    func mapToRealmObject() -> RealmType {
        let model = RealmType()
        
        model.postId = postId
        model.id = id
        model.name = name
        model.email = email
        model.body = body
        
        return model
    }
    
}

