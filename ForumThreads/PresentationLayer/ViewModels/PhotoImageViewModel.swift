//
//  PhotoImageViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 03.12.2017.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation

class PhotoImageViewModel : ImageViewModel {
    private var _photo:Photo
    
    init(photo:Photo!) {
        self._photo = photo
        super.init()
        self.caption = photo.title
    }
}
