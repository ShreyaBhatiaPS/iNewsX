//
//  String+extension.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 05/07/22.
//

import Foundation

extension String {
    func classInstance() -> AnyClass? {
        return NSClassFromString(self)
    }
}
