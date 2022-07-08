//
//  NewsViewModelImpl.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 06/07/22.
//

import Foundation

class NewsViewModelImpl: INewsViewModel {
    
    var resultImplementation: NewsViewModelResult?
    
    var news: [NewsData] = []
    
    private let useCase: INewsUseCase
    
    init(useCase: INewsUseCase) {
        self.useCase = useCase
    }
    
    func fetchNews() {
        
        DispatchQueue.main.async { [weak self] in
            self?.useCase.getTheNews { result in
                switch result {
                case .success(let model):
                    self?.news = model.data
                    self?.resultImplementation?.success()
                case .failure(let error):
                    self?.resultImplementation?.gotError(error)
                }
            }
        }
        
    }
}
