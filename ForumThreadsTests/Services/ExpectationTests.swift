//
//  ExpectationTests.swift
//  ForumThreadsTests
//
//  Created by aSqar on 13.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

@testable import ForumThreads
import XCTest
import RealmSwift
import Alamofire
import ObjectMapper
import ObjectMapper_Realm
import Foundation

class ExpectationTests : BaseViewModelTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK :- Level1
    
    func testExpectation_Networking_Realm_fetchPosts() {
        let _: [RlmPost] = self.testExpectation_Networking_Realm_FetchMultiple(request: ApiRoutes.Level1_getMultiple.posts, description: "all posts")
    }
    
    func testExpectation_Networking_Realm_fetchAlbums() {
        let _: [RlmAlbum] = self.testExpectation_Networking_Realm_FetchMultiple(request: ApiRoutes.Level1_getMultiple.albums, description: "all albums")
    }
    
    func testExpectation_Networking_Realm_fetchPhotos() {
        let _: [RlmPhoto] = self.testExpectation_Networking_Realm_FetchMultiple(request: ApiRoutes.Level1_getMultiple.photos, description: "all photos")
    }
    
    func testExpectation_Networking_Realm_fetchUsers() {
        let _: [RlmUser] = self.testExpectation_Networking_Realm_FetchMultiple(request: ApiRoutes.Level1_getMultiple.users, description: "all users")
    }
    
    // MARK :- Level3
    
    func testExpectation_Networking_Realm_fetchPhotosOfAlbum() {
        let album = RlmAlbum()
        album.id = 1
        let _: [RlmPhoto] = self.testExpectation_Networking_Realm_FetchMultiple(request: ApiRoutes.Level3_getMultipleCached.photosOf(album: album), description: "photos of album")
    }
    
    func testExpectation_Networking_Realm_fetchTodosOfUser() {
        let user = RlmUser()
        user.id = 1
        let _: [RlmTodo] = self.testExpectation_Networking_Realm_FetchMultiple(request: ApiRoutes.Level3_getMultipleCached.todosOf(user: user), description: "todos of user")
    }
    
    func testExpectation_Networking_Realm_fetchAlbumsOfUser() {
        let user = RlmUser()
        user.id = 1
        let _: [RlmAlbum] = self.testExpectation_Networking_Realm_FetchMultiple(request: ApiRoutes.Level3_getMultipleCached.albumsOf(user: user), description: "albums of user")
    }
    
    func testExpectation_Networking_Realm_fetchPostsOfUser() {
        let user = RlmUser()
        user.id = 1
        let _: [RlmPost] = self.testExpectation_Networking_Realm_FetchMultiple(request: ApiRoutes.Level3_getMultipleCached.postsOf(user: user), description: "posts of user")
    }
    
    // MARK :- Level2
    
    func testExpectation_Networking_Realm_fetchPost() {
        let _: RlmPost = self.testExpectation_Networking_Realm_FetchSingle(request: ApiRoutes.Level2_getSingle.postBy(id: 1), description: "single post")
    }
    
    func testExpectation_Networking_Realm_fetchComment() {
        let _: RlmPost = self.testExpectation_Networking_Realm_FetchSingle(request: ApiRoutes.Level2_getSingle.commentBy(id: 1), description: "single comment")
    }
    
    func testExpectation_Networking_Realm_fetchAlbum() {
        let _: RlmPost = self.testExpectation_Networking_Realm_FetchSingle(request: ApiRoutes.Level2_getSingle.albumBy(id: 1), description: "single album")
    }
    
    func testExpectation_Networking_Realm_fetchPhoto() {
        let _: RlmPost = self.testExpectation_Networking_Realm_FetchSingle(request: ApiRoutes.Level2_getSingle.photoBy(id: 1), description: "single photo")
    }
    
    func testExpectation_Networking_Realm_fetchUser() {
        let _: RlmPost = self.testExpectation_Networking_Realm_FetchSingle(request: ApiRoutes.Level2_getSingle.userBy(id: 1), description: "single user")
    }
    
    func testExpectation_Networking_Realm_fetchTodo() {
        let _: RlmPost = self.testExpectation_Networking_Realm_FetchSingle(request: ApiRoutes.Level2_getSingle.todoBy(id: 1), description: "single post")
    }
    
    // MARK :-
    
    func testExpectation_Networking_Realm_FetchMultiple<ResultType: Mappable>(request: URLRequestConvertible, description: String) -> [ResultType] {
        let expectation:XCTestExpectation! = self.expectation(description: description)
        
        var resultValues: [ResultType]? = nil
        Networking.fetchMultipleItems(request) { (result: Result<[ResultType]>) in
            XCTAssertTrue(result.isSuccess, "result should be success")
            XCTAssertTrue((result.value != nil), "result value shouldn't be nil")
            resultValues = result.value
            XCTAssertTrue((resultValues?.count)! > 0, "result value array should not be empty")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        return resultValues!
    }
    
    func testExpectation_Networking_Realm_FetchSingle<ResultType: Mappable>(request: URLRequestConvertible, description: String) -> ResultType {
        let expectation:XCTestExpectation! = self.expectation(description: description)
        
        var resultValue: ResultType? = nil
        Networking.fetchSingleItem(request) { (result: Result<ResultType>) in
            XCTAssertTrue(result.isSuccess, "result should be success")
            XCTAssertTrue((result.value != nil), "result value shouldn't be nil")
            resultValue = result.value
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        return resultValue!
    }

}
