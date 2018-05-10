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
    
    typealias RealmType = RlmUser
    
    static func mapFromRealmObject(_ object: RealmType) -> UserDto {
        var model = UserDto()
        
        model.id = object.id
        model.name = object.name
        model.username = object.username
        model.email = object.email
        model.address = AddressDto()
        model.address.street = object.street
        model.address.suite = object.suite
        model.address.city = object.city
        model.address.zipcode = object.zipcode
        model.address.geo = GeoDto()
        model.address.geo.lat = object.lat
        model.address.geo.lng = object.lng
        model.phone = object.phone
        model.website = object.website
        model.company = CompanyDto()
        model.company.name = object.companyName
        model.company.catchPhrase = object.catchPhrase
        model.company.bs = object.bs
        
        return model
    }
    
    func mapToRealmObject() -> RealmType {
        let model = RealmType()
        
        model.id = id
        model.name = name
        model.username = username
        model.email = email
        model.street = address.street
        model.suite = address.suite
        model.city = address.city
        model.zipcode = address.zipcode
        model.lat = address.geo.lat
        model.lng = address.geo.lng
        model.phone = phone
        model.website = website
        model.companyName = company.name
        model.catchPhrase = company.catchPhrase
        model.bs = company.bs
        
        return model
    }
    
}

