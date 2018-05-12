//
//  PhotoListViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import SwiftFetchedResultsController
import RealmSwift

class PhotoListViewModel: FetchedResultsViewModel<RlmPhoto> {
    
    typealias RealmType = RlmPhoto
    
    override var title : String! {
        return "Photos".localized
    }
    
    override var serviceUrl : String! {
        return ""
    }
    
    override var fieldsToSearch: [String] { get { return ["title"] } }
    
    override func sortDescriptors() -> [SortDescriptor]! {
        return [ SortDescriptor(keyPath:"id", ascending:true) ]
    }
    
    override func fetchData(updating:Bool)
    {
        CachedNetworkService().fetchPhotos(completion: self.completion())
    }
    
    override func processDownloadedResults(results: [RealmType]) {
        
        do {
            try self.realm().write {
                self.realm().add(results, update: true)
            }
        } catch let error {
            print(error)
        }
    }
    
    override func objectAtIndexPath(indexPath:IndexPath!) -> PhotoViewModel! {
        let photo:RealmType = self.fetchedResultsController.objectAtIndexPath(indexPath)!
        return PhotoViewModel(photo: PhotoDto.mapFromRealmObject(photo))
    }
}

