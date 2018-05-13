//
//  Todos.swift
//  ForumThreadsTests
//
//  Created by aSqar on 13.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

@testable import ForumThreads
import XCTest

class Todos : BaseViewModelTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    class MockTodoListViewModel : UserTodosViewModel {
        override func fetchData(updating:Bool)
        {
            // do nothing
        }
    }
    
    func testInitializationSingleItemViewModel() {
        var todo:TodoDto! = TodoDto()
        todo.title = "kittens"
        todo.id = 1
        todo.userId = 2
        
        let viewModel:TodoViewModel! = TodoViewModel(todo: todo)
        XCTAssertNotNil(viewModel, "The view model should not be nil.")
        XCTAssertTrue(viewModel.todo.title == "kittens", "The item should be equal to the value that was passed in.")
    }
    
    func testContent() {
        let parent = RlmUser()
        
        do {
            try self.realm.write {
                parent.id = 1
                self.realm.add(parent)
                
                let item1 = RlmTodo()
                item1.id = 1
                item1.title = "title1"
                item1.user = parent
                item1.userId = 1
                self.realm.add(item1)
                
                let item2 = RlmTodo()
                item2.id = 2
                item2.title = "title2"
                item2.user = parent
                item2.userId = 1
                self.realm.add(item2)
            }
        } catch let error {
            XCTAssertNil(error, "error should be nill")
        }
        
        let mockViewModel = MockTodoListViewModel(user: UserDto.mapFromRealmObject(parent))
        
        XCTAssertNotNil(mockViewModel, "The view model should not be nil.")
        XCTAssertEqual(mockViewModel.numberOfSections(), 1)
        XCTAssertEqual(mockViewModel.numberOfItemsInSection(section: 0), 2)
        
        let singleViewModel = mockViewModel.objectAtIndexPath(indexPath: IndexPath(row:0, section:0))
        XCTAssertTrue((singleViewModel?.todo.title == "title1"), "The item should be equal to the value that was passed in.")
    }
}

