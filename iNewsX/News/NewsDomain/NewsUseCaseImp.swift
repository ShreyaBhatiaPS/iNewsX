//
//  NewsUseCaseImp.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 06/07/22.
//

import Foundation

class NewsUseCaseImp: INewsUseCase {
    
    let repository: INewsRepository
    
    init(repository: INewsRepository) {
        self.repository = repository
    }
    
    func getTheNews(callback: @escaping NewsCompletionHandler) {
        repository.makeNetworkCallToGetNews { result in
            switch result {
            case .success(let model):
                callback(.success(model))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
}
