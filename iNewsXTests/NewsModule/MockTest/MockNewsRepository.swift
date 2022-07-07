//
//  MockNewsRepository.swift
//  iNewsXTests
//
//  Created by Shreya Bhatia on 07/07/22.
//

import Foundation


class MockNewsRepository: INewsRepository {
    
    var newsData: News?
    
    func makeNetworkCallToGetNews(completion: NewsCompletionHandler?) {
        if let newsData = newsData {
            completion!(.success(newsData))
        } else {
            completion!(.failure(BaseErrorClass(message: "Data not found")))
        }
    }
}
