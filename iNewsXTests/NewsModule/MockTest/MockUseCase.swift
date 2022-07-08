//
//  MockUseCase.swift
//  iNewsXTests
//
//  Created by Shreya Bhatia on 07/07/22.
//

import Foundation

class MockUseCase: INewsUseCase {
    
    var news: News?
    var error: BaseErrorClass?
    let repository = MockNewsRepository()
    
    func getTheNews(callback: @escaping NewsCompletionHandler) {
        repository.newsData = news
        repository.error = error
        repository.makeNetworkCallToGetNews { result in
            callback(result)
        }
    }
}
