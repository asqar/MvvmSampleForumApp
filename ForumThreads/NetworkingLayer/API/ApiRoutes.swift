//
//  API+.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import Alamofire

enum ApiRoutes {
    
}

extension ApiRoutes {
    
    enum Level1_getMultiple {
        case posts
        case comments
        case albums
        case photos
        case users
        case todos
    }
    
    enum Level2_getSingle {
        case postBy(id: Int)
        case commentBy(id: Int)
        case albumBy(id: Int)
        case photoBy(id: Int)
        case userBy(id: Int)
        case todoBy(id: Int)
    }
    
    enum Level3_getMultiple {
        case postsOf(user: UserDto)
        case commentsOf(post: PostDto)
        case albumsOf(user: UserDto)
        case photosOf(album: AlbumDto)
        case todosOf(user: UserDto)
    }
    
    enum Level3_getMultipleCached {
        case postsOf(user: RlmUser)
        case commentsOf(post: RlmPost)
        case albumsOf(user: RlmUser)
        case photosOf(album: RlmAlbum)
        case todosOf(user: RlmUser)
    }
    
    enum Level1_postNew {
        case post(item: PostDto)
        case comment(item: CommentDto)
        case album(item: AlbumDto)
        case photo(item: PhotoDto)
        case user(item: UserDto)
        case todo(item: TodoDto)
    }
}


extension ApiRoutes.Level1_getMultiple: ApiRequest {
    
    var path: String {
        switch self {
        case .posts:
            return AppDelegate.currentEnvironment.baseUrl + "/posts"
        case .comments:
            return AppDelegate.currentEnvironment.baseUrl + "/comments"
        case .albums:
            return AppDelegate.currentEnvironment.baseUrl + "/albums"
        case .photos:
            return AppDelegate.currentEnvironment.baseUrl + "/photos"
        case .users:
            return AppDelegate.currentEnvironment.baseUrl + "/users"
        case .todos:
            return AppDelegate.currentEnvironment.baseUrl + "/todos"
        }
    }
}

extension ApiRoutes.Level2_getSingle: ApiRequest {
    var path: String {
        switch self {
        case .postBy(let id):
            return ApiRoutes.Level1_getMultiple.posts.path + "/" + String(id)
        case .commentBy(let id):
            return ApiRoutes.Level1_getMultiple.comments.path + "/" + String(id)
        case .albumBy(let id):
            return ApiRoutes.Level1_getMultiple.albums.path + "/" + String(id)
        case .photoBy(let id):
            return ApiRoutes.Level1_getMultiple.photos.path + "/" + String(id)
        case .userBy(let id):
            return ApiRoutes.Level1_getMultiple.users.path + "/" + String(id)
        case .todoBy(let id):
            return ApiRoutes.Level1_getMultiple.todos.path + "/" + String(id)
        }
    }
}
    
extension ApiRoutes.Level3_getMultiple: ApiRequest {
    var path: String {
        switch self {
        case .postsOf(let user):
            return ApiRoutes.Level2_getSingle.userBy(id: user.id).path + "/posts"
        case .commentsOf(let post):
            return ApiRoutes.Level2_getSingle.postBy(id: post.id).path + "/comments"
        case .albumsOf(let user):
            return ApiRoutes.Level2_getSingle.userBy(id: user.id).path + "/albums"
        case .photosOf(let album):
            return ApiRoutes.Level2_getSingle.albumBy(id: album.id).path + "/photos"
        case .todosOf(let user):
            return ApiRoutes.Level2_getSingle.userBy(id: user.id).path + "/todos"
        }
    }
}

extension ApiRoutes.Level3_getMultipleCached: ApiRequest {
    var path: String {
        switch self {
        case .postsOf(let user):
            return ApiRoutes.Level2_getSingle.userBy(id: user.id).path + "/posts"
        case .commentsOf(let post):
            return ApiRoutes.Level2_getSingle.postBy(id: post.id).path + "/comments"
        case .albumsOf(let user):
            return ApiRoutes.Level2_getSingle.userBy(id: user.id).path + "/albums"
        case .photosOf(let album):
            return ApiRoutes.Level2_getSingle.albumBy(id: album.id).path + "/photos"
        case .todosOf(let user):
            return ApiRoutes.Level2_getSingle.userBy(id: user.id).path + "/todos"
        }
    }
}

extension ApiRoutes.Level1_postNew: ApiRequest {
    
    var method: HTTPMethod {
        return .post
    }
    
    var path: String {
        switch self {
        case .post:
            return AppDelegate.currentEnvironment.baseUrl + "/posts"
        case .comment:
            return AppDelegate.currentEnvironment.baseUrl + "/comments"
        case .album:
            return AppDelegate.currentEnvironment.baseUrl + "/albums"
        case .photo:
            return AppDelegate.currentEnvironment.baseUrl + "/photos"
        case .user:
            return AppDelegate.currentEnvironment.baseUrl + "/users"
        case .todo:
            return AppDelegate.currentEnvironment.baseUrl + "/todos"
        }
    }
    
    var params: Parameters? {
        switch self {
        case .post(let item):
            return item.toJSON()
        case .comment(let item):
            return item.toJSON()
        case .album(let item):
            return item.toJSON()
        case .photo(let item):
            return item.toJSON()
        case .user(let item):
            return item.toJSON()
        case .todo(let item):
            return item.toJSON()
        }
    }
    
}
