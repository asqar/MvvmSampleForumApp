//
//  Created by Askar Bakirov on 15.02.18.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RealmSwift


protocol LocalDataStoreProtocol {
    func fetchPosts() -> Results<RlmPost>
    func fetchComments() -> Results<RlmComment>
    func fetchAlbums() -> Results<RlmAlbum>
    func fetchPhotos() -> Results<RlmPhoto>
    func fetchUsers() -> Results<RlmUser>
    func fetchTodos() -> Results<RlmTodo>
}
