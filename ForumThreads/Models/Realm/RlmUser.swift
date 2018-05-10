//
//  RlmUser.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import ObjectMapper
import ObjectMapper_Realm

class RlmUser : RlmEntity, Mappable {

    @objc dynamic var name: String!
    @objc dynamic var username: String!
    @objc dynamic var email: String!
    @objc dynamic var phone: String!
    @objc dynamic var website: String!
    
    @objc dynamic var street: String!
    @objc dynamic var suite: String!
    @objc dynamic var city: String!
    @objc dynamic var zipcode: String!
    
    @objc dynamic var lat: Float = 0
    @objc dynamic var lng: Float = 0
    
    @objc dynamic var companyName: String!
    @objc dynamic var catchPhrase: String!
    @objc dynamic var bs: String!
    
    // MARK: - Mapping directly from JSON
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        username <- map["username"]
        email <- map["email"]
        street <- map["address.street"]
        suite <- map["address.suite"]
        city <- map["address.city"]
        zipcode <- map["address.zipcode"]
        lat <- map["address.geo.lat"]
        lng <- map["address.geo.lat"]
        zipcode <- map["address.zipcode"]
        phone <- map["phone"]
        website <- map["website"]
        companyName <- map["company.name"]
        catchPhrase <- map["catchPhrase"]
        bs <- map["bs"]
    }
}
