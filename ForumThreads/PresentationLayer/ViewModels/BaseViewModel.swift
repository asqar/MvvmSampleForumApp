//
//  BaseViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import ReactiveViewModel
import RealmSwift

protocol IBaseViewModel {
    
}

class BaseViewModel : RVMViewModel, IBaseViewModel {

    func realm() -> Realm {
        return try! Realm()
    }
    
    func dataStore() -> LocalDataStore! {
        return LocalDataStore()
    }
}
