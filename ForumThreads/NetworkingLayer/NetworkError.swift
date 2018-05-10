//
//  NetworkError.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation


enum NetworkError: Error {
    
    case mappingError
    case customError(title: String, message: String?)
    
    
    var title: String {
        switch self {
        case .customError(title: let title, message: _):
            return title
        default:
            return "Ошибка"
        }
    }
    
    var message: String? {
        switch self {
        case .mappingError:
            return "Формат данных изменился. Обновите версию приложения"
        case .customError(title: _, message: let message):
            return message
        }
    }
    
}
