//
//  BaseViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import ReactiveViewModel
import RealmSwift

protocol ViewModelHelper {
    associatedtype OwnerType : Any
    associatedtype ViewModelType : BaseViewModel
    func setViewModelOwner(owner : OwnerType, viewModel : ViewModelType!)
}

class BaseViewModel : RVMViewModel {

    func realm() -> Realm {
        return try! Realm()
    }
    
    func dataStore() -> LocalDataStore! {
        return LocalDataStore()
    }
}
