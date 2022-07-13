//
//  News.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 04/07/22.
//

import Foundation

struct NewsList: Codable, Equatable {
    var data: [NewsData] = []
}

struct NewsData: Codable, Equatable {
    let title, content, date, imageUrl: String
}
