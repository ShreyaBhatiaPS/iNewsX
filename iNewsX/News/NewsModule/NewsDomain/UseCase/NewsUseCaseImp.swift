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
    
    func getTheNews(callback: @escaping NewsPresentationCompletionHandler) {
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
