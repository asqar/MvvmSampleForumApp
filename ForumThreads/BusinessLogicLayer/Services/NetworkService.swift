//
//  Created by Askar Bakirov on 15.02.18.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class NetworkService: NetworkServiceProtocol {
    
    // MARK: - Get all entities
    
    func fetchPosts(completion: @escaping (Result<[PostDto]>) -> Void)
    {
        Networking.fetchMultipleItems(ApiRoutes.Level1_getMultiple.posts, completion: completion);
    }
    
    func fetchAlbums(completion: @escaping (Result<[AlbumDto]>) -> Void)
    {
        Networking.fetchMultipleItems(ApiRoutes.Level1_getMultiple.albums, completion: completion);
    }
    
    func fetchUsers(completion: @escaping (Result<[UserDto]>) -> Void)
    {
        Networking.fetchMultipleItems(ApiRoutes.Level1_getMultiple.users, completion: completion);
    }
    
    // MARK: - Get all entities
    
    func fetchComments(post: PostDto, completion: @escaping (Result<[CommentDto]>) -> Void)
    {
        Networking.fetchMultipleItems(ApiRoutes.Level3_getMultiple.commentsOf(post: post), completion: completion);
    }
    
    
    func fetchPhotos(album: AlbumDto, completion: @escaping (Result<[PhotoDto]>) -> Void)
    {
        Networking.fetchMultipleItems(ApiRoutes.Level3_getMultiple.photosOf(album: album), completion: completion);
    }
    
    func fetchTodos(user : UserDto, completion: @escaping (Result<[TodoDto]>) -> Void)
    {
        Networking.fetchMultipleItems(ApiRoutes.Level3_getMultiple.todosOf(user: user), completion: completion);
    }
    
    // MARK: - Get entity by id
    
    func fetchPost(id: Int, completion: @escaping (Result<PostDto>) -> Void)
    {
        Networking.fetchSingleItem(ApiRoutes.Level2_getSingle.postBy(id: id), completion: completion);
    }
    
    func fetchComment(id: Int, completion: @escaping (Result<CommentDto>) -> Void)
    {
        Networking.fetchSingleItem(ApiRoutes.Level2_getSingle.commentBy(id: id), completion: completion);
    }
    
    func fetchAlbum(id: Int, completion: @escaping (Result<AlbumDto>) -> Void)
    {
        Networking.fetchSingleItem(ApiRoutes.Level2_getSingle.albumBy(id: id), completion: completion);
    }
    
    func fetchPhoto(id: Int, completion: @escaping (Result<PhotoDto>) -> Void)
    {
        Networking.fetchSingleItem(ApiRoutes.Level2_getSingle.photoBy(id: id), completion: completion);
    }
    
    func fetchUser(id: Int, completion: @escaping (Result<UserDto>) -> Void)
    {
        Networking.fetchSingleItem(ApiRoutes.Level2_getSingle.userBy(id: id), completion: completion);
    }
    
    func fetchTodo(id: Int, completion: @escaping (Result<TodoDto>) -> Void)
    {
        Networking.fetchSingleItem(ApiRoutes.Level2_getSingle.todoBy(id: id), completion: completion);
    }
}
