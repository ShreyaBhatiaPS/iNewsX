//
//  MockNewsRepository.swift
//  iNewsXTests
//
//  Created by Shreya Bhatia on 07/07/22.
//

import Foundation


class MockNewsRepository: INewsRepository {
    
    var news: NewsList?
    var error: BaseErrorClass?
    let service = MockService()
    
    func makeServiceCall(completion: NewsCompletionHandler?) {
        service.newsData = news
        service.error = error
        service.makeNetworkRequest { result in
            completion!(result)
        }
    }
}
