//
//  News.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 04/07/22.
//

import Foundation

//typealias News = [NewsData]

struct News: Codable, Equatable {
    var data: [NewsData] = []
}

struct NewsData: Codable, Equatable {
    let title, description, publishedDate: String
    let imageUrl, newsUrl: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "content"
        case publishedDate = "date"
        case imageUrl = "imageUrl"
        case newsUrl = "url"
    }
}
