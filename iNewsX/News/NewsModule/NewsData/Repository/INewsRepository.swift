//
//  INewsRepository.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 06/07/22.
//

import Foundation

typealias NewsDomainCompletionHandler = (Result<DomainNewsList, BaseErrorClass>) -> ()

protocol INewsRepository {
    func makeServiceCall(completion: NewsDomainCompletionHandler?)
}
