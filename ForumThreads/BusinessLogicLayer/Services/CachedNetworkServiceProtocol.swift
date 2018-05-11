//
//  Created by Askar Bakirov on 15.02.18.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import Alamofire

protocol CachedNetworkServiceProtocol {
    
    func fetchPosts(completion: @escaping (Result<[RlmPost]>) -> Void)
    func fetchComments(post: RlmPost, completion: @escaping (Result<[RlmComment]>) -> Void)
    func fetchAlbums(completion: @escaping (Result<[RlmAlbum]>) -> Void)
    func fetchPhotos(album: RlmAlbum, completion: @escaping (Result<[RlmPhoto]>) -> Void)
    func fetchUsers(completion: @escaping (Result<[RlmUser]>) -> Void)
    func fetchTodos(user : RlmUser, completion: @escaping (Result<[RlmTodo]>) -> Void)
    
    func fetchPost(id: Int, completion: @escaping (Result<RlmPost>) -> Void)
    func fetchComment(id: Int, completion: @escaping (Result<RlmComment>) -> Void)
    func fetchAlbum(id: Int, completion: @escaping (Result<RlmAlbum>) -> Void)
    func fetchPhoto(id: Int, completion: @escaping (Result<RlmPhoto>) -> Void)
    func fetchUser(id: Int, completion: @escaping (Result<RlmUser>) -> Void)
    func fetchTodo(id: Int, completion: @escaping (Result<RlmTodo>) -> Void)
    
    func createComment(comment: CommentDto, completion: @escaping (Result<RlmComment>) -> Void)
}