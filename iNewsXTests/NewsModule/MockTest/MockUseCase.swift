//
//  MockUseCase.swift
//  iNewsXTests
//
//  Created by Shreya Bhatia on 07/07/22.
//

import Foundation

class MockUseCase: INewsUseCase {
    
    var news: NewsDTO?
    var error: BaseErrorClass?
    let repository = MockNewsRepository()
    
    func getTheNews(callback: @escaping NewsDomainCompletionHandler) {
        repository.news = news
        repository.error = error
        repository.makeServiceCall { result in
            callback(result)
        }
    }
}
