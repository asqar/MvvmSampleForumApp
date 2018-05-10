//
//  Post+Realm.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RealmSwift

extension Post: RealmMappableProtocol {
    
    static func mapFromRealmObject(_ object: RlmPost) -> Post {
        var model = Post()
        
        model.userId = object.userId
        model.id = object.id
        model.title = object.title
        model.body = object.body
        
        return model
    }
    
    func mapToRealmObject() -> RlmPost {
        let model = RlmPost()
        
        model.userId = userId
        model.id = id
        model.title = title
        model.body = body
        
        return model
    }
    
}

