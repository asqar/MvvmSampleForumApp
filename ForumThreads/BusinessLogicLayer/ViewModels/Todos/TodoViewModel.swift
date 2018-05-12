//
//  TodoViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import ReactiveCocoa

class TodoViewModel : BaseViewModel {
    private(set) var todo:TodoDto {
        didSet {
            (self.updatedContentSignal as! RACSubject).sendNext({ (x:Any!) in })
        }
    }
    
    init(todo:TodoDto!) {
        self.todo = todo
        super.init()
    }
}

