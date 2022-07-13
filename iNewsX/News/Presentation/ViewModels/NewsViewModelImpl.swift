//
//  NewsViewModelImpl.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 06/07/22.
//

import Foundation

class NewsViewModelImpl: INewsViewModel {
    
    var resultDelegate: NewsViewModelResult?
    
    var news: [NewsData] = []
    
    private let useCase: INewsUseCase
    
    init(useCase: INewsUseCase) {
        self.useCase = useCase
    }
    
    func fetchNews() {
        self.useCase.getTheNews { [weak self] result in
            switch result {
            case .success(let model):
                self?.getNewsData(model: model)
            case .failure(let error):
                self?.resultDelegate?.gotError(error)
            }
        }
    }
    
    private func getNewsData(model: NewsList) {
        self.news = model.data
        resultDelegate?.success()
    }
}
