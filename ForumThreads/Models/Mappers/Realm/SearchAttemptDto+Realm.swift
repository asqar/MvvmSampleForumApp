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
    
    static func mapFromRealmObject(_ object: RlmSearchAttempt) -> SearchAttemptDto {
        var model = SearchAttemptDto()
        
        model.searchTerm = object.searchTerm
        model.dateSearched = object.dateSearched
        model.isSuccessful = object.isSuccessful
        
        return model
    }
    
    func mapToRealmObject() -> RlmSearchAttempt {
        let model = RlmSearchAttempt()
        
        model.searchTerm = searchTerm
        model.dateSearched = dateSearched
        model.isSuccessful = isSuccessful
        
        return model
    }
    
}
