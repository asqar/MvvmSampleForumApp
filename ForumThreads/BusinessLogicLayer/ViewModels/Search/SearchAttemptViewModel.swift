//
//  SearchAttemptViewModel.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation

class SearchAttemptViewModel : BaseViewModel {

    var queryString:String!
    var dateString:String!

    init(searchAttempt:SearchAttemptDto!) {
        super.init()

        let dateFormatter:DateFormatter! = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY HH:mm"
        self.dateString = dateFormatter.string(from: searchAttempt.dateSearched)
        self.queryString = searchAttempt.searchTerm


    }
}
