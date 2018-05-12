//
//  PhotoViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 03.12.2017.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import ReactiveCocoa

class PhotoViewModel : BaseViewModel {
    private(set) var photo:PhotoDto {
        didSet {
            (self.updatedContentSignal as! RACSubject).sendNext(nil)
        }
    }
    
    init(photo: PhotoDto!) {
        self.photo = photo
        super.init()
    }
}

