//
//  MockNetworkManager.swift
//  iNewsXTests
//
//  Created by Shreya Bhatia on 07/07/22.
//

import Foundation

class MockNetworkManager: INetworkManager {
    
    var newsData: News?
    var error: BaseErrorClass?
    
    func executeNetworkRequest<T>(_ type: T.Type, request: BaseRequest, completion: TaskCompletionHandler<T>?) where T : Decodable, T : Encodable {
        
        if let error = error {
            completion!(.failure(error))
        } else {
            if let newsData = newsData {
                completion!(.success(newsData as! T))
            } else {
                completion!(.failure(BaseErrorClass(message: "Failed to connect to network")))
            }
        }
    }
    
    
}
