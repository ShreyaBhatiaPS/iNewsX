//
//  INetworkManager.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 05/07/22.
//

import Foundation

typealias TaskCompletionHandler<T> = (Result<T, BaseErrorClass>) -> ()

protocol INetworkManager {
    func executeNetworkRequest<T: Codable>(_ type: T.Type, request: BaseRequest, completion: TaskCompletionHandler<T>?)
}
