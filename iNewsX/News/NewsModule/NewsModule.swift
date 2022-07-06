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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "NewsViewController") as? NewsViewController else {
            fatalError("Could not find view controller with identifier")
        }
        viewController.viewModel = callToNewsViewModel()
        viewController.viewModel?.resultImplementation = viewController
        return viewController
    }
    
    private func callToNewsViewModel() -> INewsViewModel {
        let viewModel = NewsViewModelImpl(useCase: self.callToNewsUseCase())
        return viewModel
    }
    
    private func callToNewsUseCase() -> INewsUseCase {
        let useCase = NewsUseCaseImp(repository: self.callToNewsRepo())
        return useCase
    }
    
    private func callToNewsRepo() -> INewsRepository {
        let repo = NewsRepositoryImpl(network: RestNetworkManager())
        return repo
    }
}
