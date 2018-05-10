//
//  User+Realm.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RealmSwift


extension UserDto: RealmMappableProtocol {
    
    static func mapFromRealmObject(_ object: RlmUser) -> UserDto {
        var model = UserDto()
        
        model.id = object.id
        model.name = object.name
        model.username = object.username
        model.email = object.email
        model.address = object.address
        model.phone = object.phone
        model.website = object.website
        model.company = object.company
        
        return model
    }
    
    func mapToRealmObject() -> RlmUser {
        let model = RlmUser()
        
        model.id = id
        model.name = name
        model.username = username
        model.email = email
        model.address = address
        model.phone = phone
        model.website = website
        model.company = company
        
        return model
    }
    
}

