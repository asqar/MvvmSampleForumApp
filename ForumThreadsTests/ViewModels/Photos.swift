//
//  Photos.swift
//  ForumThreadsTests
//
//  Created by aSqar on 13.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

@testable import ForumThreads
import XCTest

class Photos : BaseViewModelTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    class MockPhotoListViewModel : PhotoListViewModel {
        override func fetchData(updating:Bool)
        {
            // do nothing
        }
    }

    func testInitializationSingleItemViewModel() {
        var photo:PhotoDto! = PhotoDto()
        photo.title = "kittens"
        photo.id = 1
        photo.albumId = 2

        let viewModel:PhotoViewModel! = PhotoViewModel(photo: photo)
        XCTAssertNotNil(viewModel, "The view model should not be nil.")
        XCTAssertTrue(viewModel.photo.title == "kittens", "The item should be equal to the value that was passed in.")
    }

    func testContent() {
        do {
            try self.realm.write {
                let item1 = RlmPhoto()
                item1.id = 1
                item1.title = "title1"
                self.realm.add(item1)
                
                let item2 = RlmPhoto()
                item2.id = 2
                item2.title = "title2"
                self.realm.add(item2)
            }
        } catch let error {
            XCTAssertNil(error, "error should be nill")
        }
        
        let mockViewModel = MockPhotoListViewModel()
        
        XCTAssertNotNil(mockViewModel, "The view model should not be nil.")
        XCTAssertEqual(mockViewModel.numberOfSections(), 1)
        XCTAssertEqual(mockViewModel.numberOfItemsInSection(section: 0), 2)
        
        let singleViewModel = mockViewModel.objectAtIndexPath(indexPath: IndexPath(row:0, section:0))
        XCTAssertTrue((singleViewModel?.photo.title == "title1"), "The item should be equal to the value that was passed in.")
    }
}
