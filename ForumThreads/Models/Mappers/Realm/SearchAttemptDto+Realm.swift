//
//  SearchAttempt+Realm.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RealmSwift

extension SearchAttemptDto: RealmMappableProtocol {
    
    typealias RealmType = RlmSearchAttempt
    
    static func mapFromRealmObject(_ object: RealmType) -> SearchAttemptDto {
        var model = SearchAttemptDto()
        
        model.searchTerm = object.searchTerm
        model.dateSearched = object.dateSearched
        model.isSuccessful = object.isSuccessful
        
        return model
    }
    
    func mapToRealmObject() -> RealmType {
        let model = RealmType()
        
        model.searchTerm = searchTerm
        model.dateSearched = dateSearched
        model.isSuccessful = isSuccessful
        
        return model
    }
    
}
