//
//  RealmMappableProtocol.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RealmSwift


protocol RealmMappableProtocol {
    
    associatedtype RealmType: Object
    
    init()
    func mapToRealmObject() -> RealmType
    static func mapFromRealmObject(_ object: RealmType) -> Self
    
}
