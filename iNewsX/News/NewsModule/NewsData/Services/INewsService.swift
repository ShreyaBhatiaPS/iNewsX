//
//  INewsService.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 13/07/22.
//

import Foundation

typealias NewsCompletionHandler = (Result<NewsDTO, BaseErrorClass>) -> ()

protocol INewsService {
    func makeNetworkRequest(completion: NewsCompletionHandler?)
}
