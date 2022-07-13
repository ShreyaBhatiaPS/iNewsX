//
//  INewsUseCase.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 06/07/22.
//

import Foundation

protocol INewsUseCase {
    func getTheNews(callback: @escaping NewsDomainCompletionHandler)
}
