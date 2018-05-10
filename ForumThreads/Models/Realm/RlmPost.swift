//
//  RlmPost.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RealmSwift

class RlmPost : RlmEntity {
    
    @objc dynamic var userId:Int = 0
    @objc dynamic var title: String!
    @objc dynamic var body: String!
    
    @objc dynamic var searchAttempt:RlmSearchAttempt!
    
    @objc dynamic var user:RlmUser!
}

