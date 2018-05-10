//
//  SearchAttempt.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RealmSwift

class RlmSearchAttempt : RlmEntity {

    @objc dynamic var searchTerm:String!
    @objc dynamic var dateSearched:Date!
    @objc dynamic var isSuccessful:Bool = false
    let posts = List<RlmPost>()
    
    override class func primaryKey() -> String? {
        return "searchTerm"
    }
}
