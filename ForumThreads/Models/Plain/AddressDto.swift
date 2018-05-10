//
//  AddressDto.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation

struct AddressDto {
    var street: String!
    var suite: String!
    var city: String!
    var zipcode: String!
    var geo: GeoDto!
    
    init() { }
}
