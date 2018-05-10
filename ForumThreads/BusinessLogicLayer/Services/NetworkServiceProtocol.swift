//
//  Created by Askar Bakirov on 15.02.18.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    
    // MARK: - Plain types
    
    func fetchPosts(completion: @escaping (Result<[PostDto]>) -> Void)
    func fetchComments(post: PostDto, completion: @escaping (Result<[CommentDto]>) -> Void)
    func fetchAlbums(completion: @escaping (Result<[AlbumDto]>) -> Void)
    func fetchPhotos(album: AlbumDto, completion: @escaping (Result<[PhotoDto]>) -> Void)
    func fetchUsers(completion: @escaping (Result<[UserDto]>) -> Void)
    func fetchTodos(user : UserDto, completion: @escaping (Result<[TodoDto]>) -> Void)
    
    func fetchPost(id: Int, completion: @escaping (Result<PostDto>) -> Void)
    func fetchComment(id: Int, completion: @escaping (Result<CommentDto>) -> Void)
    func fetchAlbum(id: Int, completion: @escaping (Result<AlbumDto>) -> Void)
    func fetchPhoto(id: Int, completion: @escaping (Result<PhotoDto>) -> Void)
    func fetchUser(id: Int, completion: @escaping (Result<UserDto>) -> Void)
    func fetchTodo(id: Int, completion: @escaping (Result<TodoDto>) -> Void)
    
}
