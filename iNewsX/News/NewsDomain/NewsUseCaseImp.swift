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
        repository.makeServiceCall { result in
            callback(result)
        }
    }
    
}
