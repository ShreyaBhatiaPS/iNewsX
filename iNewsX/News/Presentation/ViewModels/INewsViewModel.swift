//
//  INewsViewModel.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 06/07/22.
//

import Foundation

protocol INewsViewModel {
    var news: [NewsData] { get }
    func fetchNews()
    var resultImplementation: NewsViewModelResult? { get set }
}
