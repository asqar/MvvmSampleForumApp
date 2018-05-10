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
        case postsOf(user: User)
        case commentsOf(post: Post)
        case albumsOf(user: User)
        case photosOf(album: Album)
        case todosOf(user: User)
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
