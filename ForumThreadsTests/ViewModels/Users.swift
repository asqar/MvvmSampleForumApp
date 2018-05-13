//
//  Users.swift
//  ForumThreadsTests
//
//  Created by aSqar on 13.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

@testable import ForumThreads
import XCTest

class Users : BaseViewModelTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    class MockUserListViewModel : AllUsersViewModel {
        override func fetchData(updating:Bool)
        {
            // do nothing
        }
    }
    
    func testInitializationSingleItemViewModel() {
        var user:UserDto! = UserDto()
        user.name = "Askar Bakirov"
        user.id = 1
        
        let viewModel:UserViewModel! = UserViewModel(user: user)
        XCTAssertNotNil(viewModel, "The view model should not be nil.")
        XCTAssertTrue(viewModel.user.name == "Askar Bakirov", "The item should be equal to the value that was passed in.")
    }
    
    func testContent() {
        do {
            try self.realm.write {
                let item1 = RlmUser()
                item1.id = 1
                item1.name = "name1"
                self.realm.add(item1)
                
                let item2 = RlmUser()
                item2.id = 2
                item2.name = "name2"
                self.realm.add(item2)
            }
        } catch let error {
            XCTAssertNil(error, "error should be nill")
        }
        
        let mockViewModel = MockUserListViewModel()
        
        XCTAssertNotNil(mockViewModel, "The view model should not be nil.")
        XCTAssertEqual(mockViewModel.numberOfSections(), 1)
        XCTAssertEqual(mockViewModel.numberOfItemsInSection(section: 0), 2)
        
        let singleViewModel = mockViewModel.objectAtIndexPath(indexPath: IndexPath(row:0, section:0))
        XCTAssertTrue((singleViewModel?.user.name == "name1"), "The item should be equal to the value that was passed in.")
    }
}
