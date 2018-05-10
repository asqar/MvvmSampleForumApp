//
//  UserDto.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation

struct UserDto {
    
    var id: Int = 0
    var name: String!
    var username: String!
    var email: String!
    var address: AddressDto!
    var phone: String!
    var website: String!
    var company: CompanyDto!
    
    init() { }
}
