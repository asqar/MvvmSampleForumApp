//
//  UserAlbumsViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import SwiftFetchedResultsController
import RealmSwift

class UserAlbumsViewModel: FetchedResultsViewModel<RlmAlbum> {
    
    private(set) var user:UserDto!
    
    init(user:UserDto!) {
        self.user = user
        super.init()
    }
    
    required init() {
    }
    
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
        CachedNetworkService().fetchAlbums(user: self.user.mapToRealmObject(), completion: self.completion())
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
    
    func createNewAlbum() -> NewAlbumViewModel! {
        var album = AlbumDto()
        album.userId = user.id
        #if DEBUG
        album.title = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        #endif
        return NewAlbumViewModel(album: album)
    }
}


