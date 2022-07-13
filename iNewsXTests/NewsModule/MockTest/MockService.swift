//
//  MockService.swift
//  iNewsXTests
//
//  Created by Shreya Bhatia on 13/07/22.
//

import Foundation

class MockService: INewsService {
    
    var newsData: NewsDTO?
    var error: BaseErrorClass?
    
    func makeNetworkRequest(completion: NewsCompletionHandler?) {
        if let newsData = newsData {
            completion!(.success(newsData))
        } else if let error = error {
            completion!(.failure(error))
        }
    }
    
    
}
