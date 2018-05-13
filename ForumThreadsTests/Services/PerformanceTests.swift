//
//  PerformanceTests.swift
//  ForumThreadsTests
//
//  Created by aSqar on 13.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

@testable import ForumThreads
import Foundation
import XCTest

class PerformanceTests : BaseViewModelTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformance_fetchPosts() {
        self.measure({
            CachedNetworkService().fetchPosts(completion: { (result) in
                if result.isFailure { XCTFail() }
            })
        })
    }
    
    func testPerformance_fetchAlbums() {
        self.measure({
            CachedNetworkService().fetchAlbums(completion: { (result) in
                if result.isFailure { XCTFail() }
            })
        })
    }
    
    func testPerformance_fetchUsers() {
        self.measure({
            CachedNetworkService().fetchUsers(completion: { (result) in
                if result.isFailure { XCTFail() }
            })
        })
    }
    
    func testPerformance_fetchPhotos() {
        self.measure({
            CachedNetworkService().fetchPhotos(completion: { (result) in
                if result.isFailure { XCTFail() }
            })
        })
    }
    
    func testPerformance_fetchCommentsOfPost() {
        let post = RlmPost()
        post.id = 1
        self.measure({
            CachedNetworkService().fetchComments(post: post, completion: { (result) in
                if result.isFailure { XCTFail() }
            })
        })
    }
    
    func testPerformance_fetchPhotosOfAlbum() {
        let album = RlmAlbum()
        album.id = 1
        self.measure({
            CachedNetworkService().fetchPhotos(album: album, completion: { (result) in
                if result.isFailure { XCTFail() }
            })
        })
    }
    
    func testPerformance_fetchTodosOfUser() {
        let user = RlmUser()
        user.id = 1
        self.measure({
            CachedNetworkService().fetchTodos(user: user, completion: { (result) in
                if result.isFailure { XCTFail() }
            })
        })
    }
    
    func testPerformance_fetchAlbumsOfUser() {
        let user = RlmUser()
        user.id = 1
        self.measure({
            CachedNetworkService().fetchAlbums(user: user, completion: { (result) in
                if result.isFailure { XCTFail() }
            })
        })
    }
    
    func testPerformance_fetchPostsOfUser() {
        let user = RlmUser()
        user.id = 1
        self.measure({
            CachedNetworkService().fetchPosts(user: user, completion: { (result) in
                if result.isFailure { XCTFail() }
            })
        })
    }
    
    func testPerformance_fetchPost() {
        self.measure({
            CachedNetworkService().fetchPost(id: 1, completion: { (result) in
                if result.isFailure { XCTFail() }
            })
        })
    }
    
    func testPerformance_fetchComment() {
        self.measure({
            CachedNetworkService().fetchComment(id: 1, completion: { (result) in
                if result.isFailure { XCTFail() }
            })
        })
    }
    
    func testPerformance_fetchAlbum() {
        self.measure({
            CachedNetworkService().fetchAlbum(id: 1, completion: { (result) in
                if result.isFailure { XCTFail() }
            })
        })
    }
    
    func testPerformance_fetchPhoto() {
        self.measure({
            CachedNetworkService().fetchPhoto(id: 1, completion: { (result) in
                if result.isFailure { XCTFail() }
            })
        })
    }
    
    func testPerformance_fetchUser() {
        self.measure({
            CachedNetworkService().fetchUser(id: 1, completion: { (result) in
                if result.isFailure { XCTFail() }
            })
        })
    }
    
    func testPerformance_fetchTodo() {
        self.measure({
            CachedNetworkService().fetchTodo(id: 1, completion: { (result) in
                if result.isFailure { XCTFail() }
            })
        })
    }
}
