//
//  SearchViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 26.11.2017.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import SwiftFetchedResultsController
import ReactiveCocoa
import RealmSwift
import SafeRealmObject

class SearchViewModel : BaseViewModel, FetchedResultsControllerDelegate {

    private(set) var updatedContentSignal:RACSignal!
    
    private var _fetchedResultsController:FetchedResultsController<RlmSearchAttempt>!
    var fetchedResultsController:FetchedResultsController<RlmSearchAttempt>! {
        get { 
            if _fetchedResultsController == nil {
                _fetchedResultsController = FetchedResultsController(fetchRequest:self.fetchRequest(), sectionNameKeyPath:nil, cacheName:nil)
                _fetchedResultsController.delegate = self
                _ = _fetchedResultsController.performFetch()
            }

            return _fetchedResultsController
        }
        set { _fetchedResultsController = newValue }
    }

    override init() {
        super.init()
        
        self.updatedContentSignal = RACSubject()
        self.updatedContentSignal.name = "SearchResultViewModel updatedContentSignal"

        self.didBecomeActiveSignal.subscribeNext({ (x) in
            self.loadHistory()
            })

    }

    func loadHistory() {
        _ = self.fetchedResultsController.performFetch()
    }

    func numberOfSections() -> Int {
        return self.fetchedResultsController.numberOfSections()
    }

    func numberOfItemsInSection(section:Int) -> Int {
        return self.fetchedResultsController.numberOfRowsForSectionIndex(section)
    }

    func objectAtIndexPath(indexPath:IndexPath!) -> SearchAttemptViewModel! {
        let search = self.fetchedResultsController.objectAtIndexPath(indexPath)
        return SearchAttemptViewModel(searchAttempt: SearchAttempt.mapFromRealmObject(search!))
    }

    // MARK: - Fetched results controller

    func fetchRequest() -> FetchRequest<RlmSearchAttempt>! {
        let sd1:SortDescriptor! = SortDescriptor(keyPath:"dateSearched", ascending:false)
        let sortDescriptors:[SortDescriptor]! = [ sd1 ]

        let fetchRequest:FetchRequest! = FetchRequest<RlmSearchAttempt>(realm: self.realm(), predicate:nil)
        fetchRequest.sortDescriptors = sortDescriptors
        return fetchRequest
    }

    func controllerWillChangeContent<T>(_ controller: FetchedResultsController<T>) where T : Object {
        
    }
    
    func controller<T>(_ controller: FetchedResultsController<T>, didChangeObject anObject: SafeObject<T>, atIndexPath indexPath: IndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) where T : Object {
        
    }
    
    func controllerDidChangeContent<T>(_ controller: FetchedResultsController<T>) where T : Object {
        
    }
    
    func controllerDidChangeSection<T>(_ controller: FetchedResultsController<T>, section: FetchResultsSectionInfo<T>, sectionIndex: UInt, changeType: NSFetchedResultsChangeType) where T : Object {
        
    }
}
