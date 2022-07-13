//
//  TaskParameters.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 05/07/22.
//

import Foundation

typealias TaskCompletionHandler<T> = (Result<T, BaseErrorClass>) -> ()

typealias NewsCompletionHandler = (Result<NewsList, BaseErrorClass>) -> ()

