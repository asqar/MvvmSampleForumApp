//
//  Created by Askar Bakirov on 15.02.18.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class NetworkService: NetworkServiceProtocol {
    
    // MARK: - Get all entities
    
    func fetchPosts(completion: @escaping (Result<[Post]>) -> Void)
    {
        Networking.fetchMultipleItems(ApiRoutes.Level1_getMultiple.posts, completion: completion);
    }
    
    func fetchAlbums(completion: @escaping (Result<[Album]>) -> Void)
    {
        Networking.fetchMultipleItems(ApiRoutes.Level1_getMultiple.albums, completion: completion);
    }
    
    func fetchUsers(completion: @escaping (Result<[User]>) -> Void)
    {
        Networking.fetchMultipleItems(ApiRoutes.Level1_getMultiple.users, completion: completion);
    }
    
    // MARK: - Get all entities
    
    func fetchComments(post: Post, completion: @escaping (Result<[Comment]>) -> Void)
    {
        Networking.fetchMultipleItems(ApiRoutes.Level3_getMultiple.commentsOf(post: post), completion: completion);
    }
    
    
    func fetchPhotos(album: Album, completion: @escaping (Result<[Photo]>) -> Void)
    {
        Networking.fetchMultipleItems(ApiRoutes.Level3_getMultiple.photosOf(album: album), completion: completion);
    }
    
    func fetchTodos(user : User, completion: @escaping (Result<[Todo]>) -> Void)
    {
        Networking.fetchMultipleItems(ApiRoutes.Level3_getMultiple.todosOf(user: user), completion: completion);
    }
    
    // MARK: - Get entity by id
    
    func fetchPost(id: Int, completion: @escaping (Result<Post>) -> Void)
    {
        Networking.fetchSingleItem(ApiRoutes.Level2_getSingle.postBy(id: id), completion: completion);
    }
    
    func fetchComment(id: Int, completion: @escaping (Result<Comment>) -> Void)
    {
        Networking.fetchSingleItem(ApiRoutes.Level2_getSingle.commentBy(id: id), completion: completion);
    }
    
    func fetchAlbum(id: Int, completion: @escaping (Result<Album>) -> Void)
    {
        Networking.fetchSingleItem(ApiRoutes.Level2_getSingle.albumBy(id: id), completion: completion);
    }
    
    func fetchPhoto(id: Int, completion: @escaping (Result<Photo>) -> Void)
    {
        Networking.fetchSingleItem(ApiRoutes.Level2_getSingle.photoBy(id: id), completion: completion);
    }
    
    func fetchUser(id: Int, completion: @escaping (Result<User>) -> Void)
    {
        Networking.fetchSingleItem(ApiRoutes.Level2_getSingle.userBy(id: id), completion: completion);
    }
    
    func fetchTodo(id: Int, completion: @escaping (Result<Todo>) -> Void)
    {
        Networking.fetchSingleItem(ApiRoutes.Level2_getSingle.todoBy(id: id), completion: completion);
    }
}
