//
//  Albums.swift
//  ForumThreadsTests
//
//  Created by aSqar on 13.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

@testable import ForumThreads
import XCTest

class Albums : BaseViewModelTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    class MockAlbumListViewModel : AlbumListViewModel {
        override func fetchData(updating:Bool)
        {
            // do nothing
        }
    }
    
    func testInitializationSingleItemViewModel() {
        var album:AlbumDto! = AlbumDto()
        album.title = "kittens"
        album.id = 1
        album.userId = 2
        
        let viewModel:AlbumViewModel! = AlbumViewModel(album: album)
        XCTAssertNotNil(viewModel, "The view model should not be nil.")
        XCTAssertTrue(viewModel.album.title == "kittens", "The item should be equal to the value that was passed in.")
    }
    
    func testContent() {
        do {
            try self.realm.write {
                let item1 = RlmAlbum()
                item1.id = 1
                item1.title = "title1"
                self.realm.add(item1)
                
                let item2 = RlmAlbum()
                item2.id = 2
                item2.title = "title2"
                self.realm.add(item2)
            }
        } catch let error {
            XCTAssertNil(error, "error should be nill")
        }
        
        let mockViewModel = MockAlbumListViewModel()
        
        XCTAssertNotNil(mockViewModel, "The view model should not be nil.")
        XCTAssertEqual(mockViewModel.numberOfSections(), 1)
        XCTAssertEqual(mockViewModel.numberOfItemsInSection(section: 0), 2)
        
        let singleViewModel = mockViewModel.objectAtIndexPath(indexPath: IndexPath(row:0, section:0))
        XCTAssertTrue((singleViewModel?.album.title == "title1"), "The item should be equal to the value that was passed in.")
    }
}

