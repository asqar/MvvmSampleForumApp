//
//  Todo+Realm.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RealmSwift


extension TodoDto: RealmMappableProtocol {
    
    typealias RealmType = RlmTodo
    
    static func mapFromRealmObject(_ object: RealmType) -> TodoDto {
        var model = TodoDto()
        
        model.userId = object.userId
        model.id = object.id
        model.title = object.title
        model.completed = object.completed
        
        return model
    }
    
    func mapToRealmObject() -> RealmType {
        let model = RealmType()
        
        model.userId = userId
        model.id = id
        model.title = title
        model.completed = completed
        
        return model
    }
    
}

