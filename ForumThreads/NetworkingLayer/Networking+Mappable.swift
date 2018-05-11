//
//  Networking+Mappable.swift
//  ForumThreads
//
//  Created by aSqar on 10.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

extension Networking
{    
    static func fetchSingleItem<ResultType : Mappable>(_ request: URLRequestConvertible, completion: @escaping (Result<ResultType>) -> Void) {
        
        requestJSON(request) { (result: Result<ResultType>) in
            
            switch result {
            case .success(let response):
                completion(Result.success(response))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
    
    static func fetchMultipleItems<ResultType : Mappable>(_ request: URLRequestConvertible, completion: @escaping (Result<[ResultType]>) -> Void) {
        
        requestJSONArray(request) { (result: Result<[ResultType]>) in
            
            switch result {
            case .success(let response):
                completion(Result.success(response))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
    
    static func requestJSON<ResultType: Mappable>(_ request: URLRequestConvertible, completion: @escaping (Result<ResultType>) -> Void) {
        Alamofire.request(request)
            .validate()
            .responseString {
                response in
                
                switch response.result {
                case .success(let jsonString):
                    if let mappedObject = ResultType(JSONString: jsonString) {
                        completion(.success(mappedObject))
                    } else {
                        completion(.failure(NetworkError.mappingError))
                    }
                case .failure(let error):
                    completion(.failure(NetworkError.customError(title: error.localizedDescription, message: error.localizedDescription)))
                }
        }
    }
    
    static func requestJSONArray<ResultType: Mappable>(_ request: URLRequestConvertible, completion: @escaping (Result<[ResultType]>) -> Void) {
        Alamofire.request(request)
            .validate()
            .responseString {
                response in
                
                switch response.result {
                case .success(let jsonString):
                    if let mappedObject = Mapper<ResultType>().mapArray(JSONString: jsonString) {
                        completion(.success(mappedObject))
                    } else {
                        completion(.failure(NetworkError.mappingError))
                    }
                case .failure(let error):
                    completion(.failure(NetworkError.customError(title: error.localizedDescription, message: error.localizedDescription)))
                }
        }
    }
    
}
