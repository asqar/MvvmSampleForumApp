//
//  MyLocalizedString.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return Language.get(key: self, alter: "")
    }
}
