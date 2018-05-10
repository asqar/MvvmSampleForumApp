//
//  RlmEntity.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import RealmSwift

class RlmEntity : Object {
    
    @objc dynamic var id: Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }

    // MARK - for Realm+JSON

    class func deserializeOne(d: NSDictionary!, in: Realm!) -> AnyObject {
        return RlmEntity()
    }
    
    class func deserializeMany(a: Any?, in: Realm!) -> [AnyObject] {
        return []
    }
}
