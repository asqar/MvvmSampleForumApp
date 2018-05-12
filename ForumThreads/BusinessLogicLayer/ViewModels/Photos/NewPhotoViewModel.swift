//
//  NewPhotoViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 13.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import ReactiveCocoa

class NewPhotoViewModel : BaseViewModel {
    
    var isSaved:Bool {
        get {
            return self.photo.id != 0
        }
    }
    
    var photo:PhotoDto! {
        didSet {
            (self.updatedContentSignal as! RACSubject).sendNext(nil)
        }
    }
    
    init(photo:PhotoDto!) {
        self.photo = photo
        super.init()
    }
    
    func send(){
        CachedNetworkService().createPhoto(photo: photo) { (resultPhoto) in
            resultPhoto.withValue({ (rlmPhoto) in
                self.photo = PhotoDto.mapFromRealmObject(rlmPhoto)
                
                do {
                    try self.realm().write {
                        self.realm().add(rlmPhoto, update: true)
                    }
                } catch let error {
                    print(error)
                }
                
            })
        }
    }
}
