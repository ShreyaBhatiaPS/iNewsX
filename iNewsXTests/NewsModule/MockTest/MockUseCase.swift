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
    
    func getTheNews(callback: @escaping NewsPresentationCompletionHandler) {
        repository.news = news
        repository.error = error
        repository.makeServiceCall { result in
            switch result {
            case .success(let newsList):
                callback(.success(newsList.toPresentation()))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
