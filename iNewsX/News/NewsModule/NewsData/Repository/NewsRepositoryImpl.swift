//
//  NewsRepositoryImpl.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 06/07/22.
//

import Foundation

class NewsRepositoryImpl: INewsRepository {
    
    private let service: INewsService
    
    init(service: INewsService) {
        self.service = service
    }
    
    func makeServiceCall(completion: NewsDomainCompletionHandler?) {
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
