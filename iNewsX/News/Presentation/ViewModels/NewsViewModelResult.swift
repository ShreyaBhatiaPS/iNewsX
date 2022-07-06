//
//  NewsViewModelResult.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 06/07/22.
//

import Foundation

protocol NewsViewModelResult {
    func success()
    func gotError(_ error: BaseErrorClass)
}
