//
//  BaseErrorClass.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 05/07/22.
//

import Foundation

class BaseErrorClass: Error {
    
    let message: String
    
    init(message: String) {
        self.message = message
    }
}

extension BaseErrorClass: Equatable {
    
    static func == (lhs: BaseErrorClass, rhs: BaseErrorClass) -> Bool {
        return lhs.message == rhs.message
    }
    
}
