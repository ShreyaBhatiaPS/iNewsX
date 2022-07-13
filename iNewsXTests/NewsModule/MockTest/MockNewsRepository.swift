//
//  MockNewsRepository.swift
//  iNewsXTests
//
//  Created by Shreya Bhatia on 07/07/22.
//

import Foundation


class MockNewsRepository: INewsRepository {
    
    var news: NewsDTO?
    var error: BaseErrorClass?
    let service = MockService()
    
    func makeServiceCall(completion: NewsDomainCompletionHandler?) {
        service.newsData = news
        service.error = error
        service.makeNetworkRequest { result in
            switch result {
            case .success(let newsDTO):
                completion?(.success(newsDTO.toDomain()))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}
