//
//  APIMethodProtocol.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import Alamofire


protocol ApiRequest: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var params: Parameters? { get }
}


// MARK: - Defaults

extension ApiRequest {
    
    var method: HTTPMethod {
        return .get
    }
    
    var params: Parameters? {
        return nil
    }
    
}


// MARK: - URLRequestConvertible

extension ApiRequest {
    
    func asURLRequest() throws -> URLRequest {
        let url = try path.asURL()
        
        var urlRequest = Alamofire.URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        switch method {
        case .get:
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .post:
            return try Alamofire.JSONEncoding.default.encode(urlRequest, with: params)
        default:
            return urlRequest
        }
    }
    
}
