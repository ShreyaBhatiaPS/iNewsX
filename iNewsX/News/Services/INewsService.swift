//
//  INewsService.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 13/07/22.
//

import Foundation

protocol INewsService {
    func makeNetworkRequest(completion: NewsCompletionHandler?)
}
