//
//  AllUsersViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 11.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import ReactiveCocoa
import SwiftFetchedResultsController
import RealmSwift

class AllUsersViewModel : FetchedResultsViewModel<RlmUser> {
    
    typealias RealmType = RlmUser
    
    override var title : String! {
        return "Posts".localized
    }
    
    override var fieldsToSearch: [String] { get { return ["name", "username", "email"] } }
    
    override func sortDescriptors() -> [SortDescriptor]! {
        return [ SortDescriptor(keyPath:"id", ascending:true) ]
    }
    
    override var serviceUrl : String! {
        return ""
    }
    
    override func fetchData(updating:Bool)
    {
        CachedNetworkService().fetchUsers(completion: self.completion())
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
    
    override func objectAtIndexPath(indexPath:IndexPath!) -> UserViewModel! {
        let user:RealmType = self.fetchedResultsController.objectAtIndexPath(indexPath)!
        return UserViewModel(user: UserDto.mapFromRealmObject(user))
    }
    
    override func selectObjectAtIndexPath(indexPath: IndexPath!) -> BaseViewModel! {
        return objectAtIndexPath(indexPath: indexPath)
    }
}
