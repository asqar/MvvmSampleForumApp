//
//  Photo.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import RealmSwift

class RlmPhoto : RlmEntity {
    @objc dynamic var albumId: Int = 0
    @objc dynamic var title: String!
    @objc dynamic var url: String!
    @objc dynamic var thumbnailUrl: String!
    
    @objc dynamic var album:RlmAlbum!
}
