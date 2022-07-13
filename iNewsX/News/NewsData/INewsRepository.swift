//
//  INewsRepository.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 06/07/22.
//

import Foundation

protocol INewsRepository {
    func makeServiceCall(completion: NewsCompletionHandler?)
}
