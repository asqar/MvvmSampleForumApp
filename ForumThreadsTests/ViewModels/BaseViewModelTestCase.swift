//
//  BaseViewModelTestCase.swift
//  ForumThreadsTests
//
//  Created by aSqar on 13.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

@testable import ForumThreads
import RealmSwift
import XCTest
import Foundation

class BaseViewModelTestCase : XCTestCase {

    private(set) var realm:Realm!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        var config = Realm.Configuration.defaultConfiguration
        config.inMemoryIdentifier = self.name
        Realm.Configuration.defaultConfiguration = config
        do {
            self.realm = try Realm(configuration: config)
        } catch let error {
            print(error)
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}
