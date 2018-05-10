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
    
    var address: AddressDto!
    var company: CompanyDto!
    
    // MARK: - Mapping directly from JSON
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        username <- map["username"]
        email <- map["email"]
        address <- map["address"]
        phone <- map["phone"]
        website <- map["website"]
        company <- map["company"]
    }
}
