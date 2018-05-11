//
//  NewCommentViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 11.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import ReactiveCocoa

class NewCommentViewModel : BaseViewModel {
    
    var isSaved:Bool {
        get {
            return self.comment.id != 0
        }
    }
    
    var comment:CommentDto! {
        didSet {
            (self.updatedContentSignal as! RACSubject).sendNext({ (x:Any!) in })
        }
    }
    
    init(comment:CommentDto!) {
        self.comment = comment
        super.init()
    }
    
    func send(){
        CachedNetworkService().createComment(comment: comment) { (resultComment) in
            resultComment.withValue({ (rlmComment) in
                self.comment = CommentDto.mapFromRealmObject(rlmComment)
                
                do {
                    try self.realm().write {
                        self.realm().add(rlmComment, update: true)
                    }
                } catch let error {
                    print(error)
                }
                
            })
        }
    }
}
