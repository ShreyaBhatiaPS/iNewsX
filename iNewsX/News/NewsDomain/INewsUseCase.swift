//
//  INewsUseCase.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 06/07/22.
//

import Foundation

typealias NewsPresentationCompletionHandler = (Result<NewsList, BaseErrorClass>) -> ()

protocol INewsUseCase {
    func getTheNews(callback: @escaping NewsPresentationCompletionHandler)
}
