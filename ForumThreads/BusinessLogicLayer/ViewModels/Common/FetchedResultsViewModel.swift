//
//  FetchedResultsViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 26.11.2017.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import SafeRealmObject
import Realm
import RealmSwift
import SwiftFetchedResultsController
import ReactiveCocoa
import Alamofire
import ObjectMapper

protocol FetchedResultsViewModelProtocol : FetchedResultsControllerDelegate {
    
    associatedtype ViewModelType : BaseViewModel
    
    var title : String! { get }
    var updatedContentSignal:RACSignal! { get }
    var startLoadingSignal:RACSignal! { get }
    var dismissLoadingSignal:RACSignal! { get }
    var errorMessageSignal:RACSignal! { get }
    var isActive : Bool { get set }
    func numberOfSections() -> Int
    func numberOfItemsInSection(section:Int) -> Int
    func objectAtIndexPath(indexPath:IndexPath!) -> BaseViewModel!
    func fetchData(updating:Bool)
    func selectObjectAtIndexPath(indexPath:IndexPath!) -> BaseViewModel!
    
    var searchTerm : String! { get set }
    
    init()
}

class FetchedResultsViewModel<EntityType:Object> : BaseViewModel, FetchedResultsControllerDelegate, FetchedResultsViewModelProtocol {

    typealias ViewModelType = FetchedResultsViewModel
    
    private(set) var startLoadingSignal:RACSignal!
    private(set) var dismissLoadingSignal:RACSignal!
    private(set) var errorMessageSignal:RACSignal!
    
    var serviceUrl:String! {
        return ""
    }
    
    var pageSize:Int = 0
    var currentPage:Int = 0
    
    var title : String! { // virtual
        return ""
    }
    
    var fieldsToSearch: [String] { get { return [] } }
    
    var searchTerm:String! {
        didSet {
            if self.searchTerm.count > 0 {
                
                let subpredicates = fieldsToSearch.map { property in
                    return NSPredicate(format: "%K CONTAINS[c] %@", property, searchTerm)
                }
                let predicate = NSCompoundPredicate(orPredicateWithSubpredicates: subpredicates)
                let fetchRequest = self.newFetchRequest(predicate: predicate)
                self.fetchedResultsController.updateFetchRequest(fetchRequest!, sectionNameKeyPath: nil, performFetch: true)
                (self.updatedContentSignal as! RACSubject).sendNext({ (x:Any!) in })
            } else {
                self.fetchedResultsController.updateFetchRequest(self.fetchRequest, sectionNameKeyPath: nil, performFetch: true)
                (self.updatedContentSignal as! RACSubject).sendNext({ (x:Any!) in })
            }
        }
    }
    
    func sortDescriptors() -> [SortDescriptor]! {
        return [ SortDescriptor(keyPath:"id", ascending:true) ]
    }
    
    func newFetchRequest(predicate: NSPredicate?) -> FetchRequest<EntityType>! {
        let fetchRequest:FetchRequest! = FetchRequest<EntityType>(realm: self.realm(), predicate:predicate)
        fetchRequest.sortDescriptors = self.sortDescriptors()
        return fetchRequest
    }
    
    var fetchRequest: FetchRequest<EntityType>!
    {
        return newFetchRequest(predicate: nil)
    }
    
    private var _fetchedResultsController:FetchedResultsController<EntityType>!
    var fetchedResultsController:FetchedResultsController<EntityType>! {
        get { 
            if _fetchedResultsController == nil {
                _fetchedResultsController = FetchedResultsController(fetchRequest:self.fetchRequest, sectionNameKeyPath:nil, cacheName:nil)
                _fetchedResultsController.delegate = self
                _ = _fetchedResultsController.performFetch()

                (self.dismissLoadingSignal as! RACSubject).sendNext({ (x:Any!) in })
            }

            return _fetchedResultsController
        }
    }

    override required init() {
        self.currentPage = 1
        super.init()
        
//        self.updatedContentSignal = RACSubject()
        self.updatedContentSignal.name = "BaseListViewModel updatedContentSignal"
        self.startLoadingSignal = RACSubject()
        self.startLoadingSignal.name = "BaseListViewModel startLoadingSignal"
        self.dismissLoadingSignal = RACSubject()
        self.dismissLoadingSignal.name = "BaseListViewModel dismissLoadingSignal"
        self.errorMessageSignal = RACSubject()
        self.errorMessageSignal.name = "BaseListViewModel errorMessageSignal"


        self.didBecomeActiveSignal.subscribeNext({(x) in })
    }

    func numberOfSections() -> Int {
        return self.fetchedResultsController.numberOfSections()
    }

    func numberOfItemsInSection(section:Int) -> Int {
        return self.fetchedResultsController.numberOfRowsForSectionIndex(section)
    }

    // to be overriden
    func objectAtIndexPath(indexPath:IndexPath!) -> BaseViewModel! {
        preconditionFailure("This method must be overridden")
    }
    
    // to be overriden
    func selectObjectAtIndexPath(indexPath: IndexPath!) -> BaseViewModel! {
        preconditionFailure("This method must be overridden")
    }

    func processDownloadedResults(results:[EntityType]) {}
    
    func completion() -> ((Result<[EntityType]>) -> Void) {
        func completionCallback(result : Result<[EntityType]>) -> Void {
            if result.isSuccess {
                self.processDownloadedResults(results: result.value!)
                
                self._fetchedResultsController = nil
                (self.updatedContentSignal as! RACSubject).sendNext({ (x:Any!) in })
            } else if result.isFailure
            {
                (self.dismissLoadingSignal as! RACSubject).sendNext({ (x:Any!) in })
                
                #if DEBUG
                debugPrint("%@", result.error ?? "no error description")
                (self.errorMessageSignal as! RACSubject).sendNext({(x:Any!) in })
                #endif
            }
        }
        return completionCallback
    }
    
    func fetchData(updating:Bool) {
        if updating {
            self.currentPage = 1
        } else {
            self.currentPage += 1
        }
        
        
        
    }

    // MARK: - Fetched results controller

    func controllerWillChangeContent<RealmType>(_ controller: FetchedResultsController<RealmType>) where RealmType : Object {
        
    }
    
    func controller<RealmType>(_ controller: FetchedResultsController<RealmType>, didChangeObject anObject: SafeObject<RealmType>, atIndexPath indexPath: IndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) where RealmType : Object {
        (self.updatedContentSignal as! RACSubject).sendNext({ (x:Any!) in })
    }
    
    func controllerDidChangeSection<RealmType>(_ controller: FetchedResultsController<RealmType>, section: FetchResultsSectionInfo<RealmType>, sectionIndex: UInt, changeType: NSFetchedResultsChangeType) where RealmType : Object {
        (self.updatedContentSignal as! RACSubject).sendNext({ (x:Any!) in })
    }
    
    func controllerDidChangeContent<RealmType>(_ controller: FetchedResultsController<RealmType>) where RealmType : Object {
        (self.updatedContentSignal as! RACSubject).sendNext({ (x:Any!) in })
    }
}
