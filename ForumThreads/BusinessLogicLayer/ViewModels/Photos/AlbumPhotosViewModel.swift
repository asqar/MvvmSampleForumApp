//
//  AlbumPhotosViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import SwiftFetchedResultsController
import RealmSwift

class AlbumPhotosViewModel: PhotoListViewModel {
    
    private(set) var album:AlbumDto!
    
    init(album:AlbumDto!) {
        self.album = album
        super.init()
    }
    
    required init() {
    }
    
    override var fetchRequest: FetchRequest<RlmPhoto>!
    {
        return newFetchRequest(predicate: NSPredicate(format: "albumId == %d", self.album.id))
    }
    
    override func fetchData(updating:Bool)
    {
        CachedNetworkService().fetchPhotos(album: album.mapToRealmObject(), completion: self.completion())
    }
        
    func createNewPhoto() -> NewPhotoViewModel! {
        var photo = PhotoDto()
        photo.albumId = album.id
        #if DEBUG
        photo.title = "Lorem ipsum dolor sit er elit lamet"
        #endif
        return NewPhotoViewModel(photo: photo)
    }
}
