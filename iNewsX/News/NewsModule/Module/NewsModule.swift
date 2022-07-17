//
//  NewsModule.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 06/07/22.
//

import Foundation
import UIKit


class NewsModule {
    
    func callToNewsViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: ViewControllerConstant.mainStoryBoard, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: ViewControllerConstant.newsVCIdentifier) as? NewsViewController else {
            fatalError(ViewControllerConstant.newsVCFailure)
        }
        viewController.viewModel = callToNewsViewModel(viewController: viewController)
        return viewController
    }
    
    private func callToNewsViewModel(viewController: UIViewController) -> INewsViewModel {
        let viewModel = NewsViewModelImpl(useCase: self.callToNewsUseCase(), resultDelegate: viewController as? NewsViewModelResult)
        return viewModel
    }
    
    private func callToNewsUseCase() -> INewsUseCase {
        let useCase = NewsUseCaseImp(repository: self.callToNewsRepo())
        return useCase
    }
    
    private func callToNewsRepo() -> INewsRepository {
        let repo = NewsRepositoryImpl(service: self.callToNewsService())
        return repo
    }
    
    private func callToNewsService() -> INewsService {
        let service = NewsServiceImpl(network: RestNetworkManager())
        return service
    }
}
