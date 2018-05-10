//
//  Created by Askar Bakirov on 15.02.18.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RealmSwift


class LocalDataStore: LocalDataStoreProtocol {
  
    func fetchPosts() -> Results<RlmPost>
    {
        let realm = try! Realm()
        return realm.objects(RlmPost.self)
    }
    
    func fetchComments() -> Results<RlmComment>
    {
        let realm = try! Realm()
        return realm.objects(RlmComment.self)
    }
    
    func fetchAlbums() -> Results<RlmAlbum>
    {
        let realm = try! Realm()
        return realm.objects(RlmAlbum.self)
    }
    
    func fetchPhotos() -> Results<RlmPhoto>
    {
        let realm = try! Realm()
        return realm.objects(RlmPhoto.self)
    }
    
    func fetchUsers() -> Results<RlmUser>
    {
        let realm = try! Realm()
        return realm.objects(RlmUser.self)
    }
    
    func fetchTodos() -> Results<RlmTodo>
    {
        let realm = try! Realm()
        return realm.objects(RlmTodo.self)
    }
    
  
}
