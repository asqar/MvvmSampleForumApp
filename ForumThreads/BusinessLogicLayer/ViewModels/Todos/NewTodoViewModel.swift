//
//  NewTodoViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import ReactiveCocoa

class NewTodoViewModel : BaseViewModel {
    
    var isSaved:Bool {
        get {
            return self.todo.id != 0
        }
    }
    
    var todo:TodoDto! {
        didSet {
            (self.updatedContentSignal as! RACSubject).sendNext({ (x:Any!) in })
        }
    }
    
    init(todo:TodoDto!) {
        self.todo = todo
        super.init()
    }
    
    func send(){
        CachedNetworkService().createTodo(todo: todo) { (resultTodo) in
            resultTodo.withValue({ (rlmTodo) in
                self.todo = TodoDto.mapFromRealmObject(rlmTodo)
                
                do {
                    try self.realm().write {
                        self.realm().add(rlmTodo, update: true)
                    }
                } catch let error {
                    print(error)
                }
                
            })
        }
    }
}
