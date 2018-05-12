//
//  AlbumViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import ReactiveCocoa

class AlbumViewModel : BaseViewModel {
    private(set) var album:AlbumDto {
        didSet {
            (self.updatedContentSignal as! RACSubject).sendNext({ (x:Any!) in })
        }
    }
    
    init(album:AlbumDto!) {
        self.album = album
        super.init()
    }
}
