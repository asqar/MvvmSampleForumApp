//
//  CommentViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 11.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import ReactiveCocoa

class CommentViewModel : BaseViewModel {
    private(set) var comment:CommentDto {
        didSet {
            (self.updatedContentSignal as! RACSubject).sendNext({ (x:Any!) in })
        }
    }
    
    init(comment:CommentDto!) {
        self.comment = comment
        super.init()
    }
}
