//
//  Comments.swift
//  ForumThreadsTests
//
//  Created by aSqar on 13.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

@testable import ForumThreads
import XCTest

class Comments : BaseViewModelTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    class MockCommentListViewModel : PostCommentsViewModel {
        override func fetchData(updating:Bool)
        {
            // do nothing
        }
    }
    
    func testInitializationSingleItemViewModel() {
        var comment:CommentDto! = CommentDto()
        comment.body = "kittens"
        comment.id = 1
        comment.postId = 2
        
        let viewModel:CommentViewModel! = CommentViewModel(comment: comment)
        XCTAssertNotNil(viewModel, "The view model should not be nil.")
        XCTAssertTrue(viewModel.comment.body == "kittens", "The item should be equal to the value that was passed in.")
    }
    
    func testContent() {
        
        let parent = RlmPost()
        
        do {
            try self.realm.write {
                
                parent.id = 1
                self.realm.add(parent)
                
                let item1 = RlmComment()
                item1.id = 1
                item1.body = "body1"
                item1.post = parent
                item1.postId = 1
                self.realm.add(item1)
                
                let item2 = RlmComment()
                item2.id = 2
                item2.body = "body2"
                item2.post = parent
                item2.postId = 1
                self.realm.add(item2)
            }
        } catch let error {
            XCTAssertNil(error, "error should be nill")
        }
        
        let mockViewModel = MockCommentListViewModel(post: PostDto.mapFromRealmObject(parent))
        
        XCTAssertNotNil(mockViewModel, "The view model should not be nil.")
        XCTAssertEqual(mockViewModel.numberOfSections(), 1)
        XCTAssertEqual(mockViewModel.numberOfItemsInSection(section: 0), 2)
        
        let singleViewModel = mockViewModel.objectAtIndexPath(indexPath: IndexPath(row:0, section:0))
        XCTAssertTrue((singleViewModel?.comment.body == "body2"), "The item should be equal to the value that was passed in.")
    }
}
