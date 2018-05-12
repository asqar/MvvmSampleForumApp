//
//  UserViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 11.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import ReactiveCocoa

class UserViewModel : BaseViewModel {
    private(set) var user:UserDto {
        didSet {
            (self.updatedContentSignal as! RACSubject).sendNext(nil)
        }
    }
    
    init(user:UserDto!) {
        self.user = user
        super.init()
    }
    
    func openUserTodos() -> UserTodosViewModel! {
        return UserTodosViewModel(user: self.user)
    }
    
    func openUserAlbums() -> UserAlbumsViewModel! {
        return UserAlbumsViewModel(user: self.user)
    }
    
    func openUserPosts() -> UserPostsViewModel! {
        return UserPostsViewModel(user: self.user)
    }
}
