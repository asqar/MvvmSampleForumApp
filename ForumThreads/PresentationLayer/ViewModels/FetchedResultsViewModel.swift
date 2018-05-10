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

// These dependencies show that the abstraction leaks
import Alamofire
import ObjectMapper

protocol FetchedResultsViewModelProtocol : FetchedResultsControllerDelegate {
    
    associatedtype RealmType: Object
    
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
    
    init()
}

class FetchedResultsViewModel<EntityType:Object> : BaseViewModel, FetchedResultsControllerDelegate, FetchedResultsViewModelProtocol {
    typealias RealmType = EntityType
    
    private(set) var updatedContentSignal:RACSignal!
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

    var fetchRequest : FetchRequest<EntityType>!{ // virtual
        return nil
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
        
        self.updatedContentSignal = RACSubject()
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
        return nil
    }

    func processDownloadedResults(results:[EntityType]) {
        for _ in results
        {
            
        }
    }
    
    func completion<ResultType : BaseMappable>() -> ((Result<[ResultType]>) -> Void) {
        func completionCallback(result : Result<[ResultType]>) -> Void {
            if result.isSuccess {
                
                for _ in result.value! {
//                    EntityType.
                }
                
//                self.processDownloadedResults(results: result.value!)
                
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

    func controllerWillChangeContent<T>(_ controller: FetchedResultsController<T>) where T : Object {
        
    }
    
    func controller<T>(_ controller: FetchedResultsController<T>, didChangeObject anObject: SafeObject<T>, atIndexPath indexPath: IndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) where T : Object {
        
    }
    
    func controllerDidChangeSection<T>(_ controller: FetchedResultsController<T>, section: FetchResultsSectionInfo<T>, sectionIndex: UInt, changeType: NSFetchedResultsChangeType) where T : Object {
        
    }
    
    func controllerDidChangeContent<T>(_ controller: FetchedResultsController<T>) where T : Object {
        (self.updatedContentSignal as! RACSubject).sendNext({ (x:Any!) in
            
        })
    }
}
