//
//  BaseErrorClass.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 05/07/22.
//

import Foundation

public class BaseErrorClass: Error {
    
    public let message: String
    
    public init(message: String) {
        self.message = message
    }
}

extension BaseErrorClass: Equatable {
    
    public static func == (lhs: BaseErrorClass, rhs: BaseErrorClass) -> Bool {
        return lhs.message == rhs.message
    }
    
}
