//
//  NewAlbumViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import ReactiveCocoa

class NewAlbumViewModel : BaseViewModel {
    
    var isSaved:Bool {
        get {
            return self.album.id != 0
        }
    }
    
    var album:AlbumDto! {
        didSet {
            (self.updatedContentSignal as! RACSubject).sendNext({ (x:Any!) in })
        }
    }
    
    init(album:AlbumDto!) {
        self.album = album
        super.init()
    }
    
    func send(){
        CachedNetworkService().createAlbum(album: album) { (resultAlbum) in
            resultAlbum.withValue({ (rlmAlbum) in
                self.album = AlbumDto.mapFromRealmObject(rlmAlbum)
                
                do {
                    try self.realm().write {
                        self.realm().add(rlmAlbum, update: true)
                    }
                } catch let error {
                    print(error)
                }
                
            })
        }
    }
}
