//
//  MockNewsRepository.swift
//  iNewsXTests
//
//  Created by Shreya Bhatia on 07/07/22.
//

import Foundation


class MockNewsRepository: INewsRepository {
    
    var newsData: News?
    var error: BaseErrorClass?
    
    func makeNetworkCallToGetNews(completion: NewsCompletionHandler?) {
        if let newsData = newsData {
            completion!(.success(newsData))
        } else if let error = error {
            completion!(.failure(error))
        }
    }
}
