//
//  AlbumsViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import SwiftFetchedResultsController
import RealmSwift

class AlbumListViewModel: FetchedResultsViewModel<RlmAlbum> {
    
    typealias RealmType = RlmAlbum
    
    override var title : String! {
        return "Albums".localized
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
        CachedNetworkService().fetchAlbums(completion: self.completion())
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
    
    override func objectAtIndexPath(indexPath:IndexPath!) -> AlbumViewModel! {
        let todo:RealmType = self.fetchedResultsController.objectAtIndexPath(indexPath)!
        return AlbumViewModel(album: AlbumDto.mapFromRealmObject(todo))
    }
}
