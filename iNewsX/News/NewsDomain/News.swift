//
//  News.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 04/07/22.
//

import Foundation

//typealias News = [NewsData]

struct News: Codable {
    var data: [NewsData] = []
}

struct NewsData: Codable {
    let id, title, description, publishedDate, author, time: String
    let imageUrl, newsUrl: String
    let readMoreUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "content"
        case publishedDate = "date"
        case author = "author"
        case imageUrl = "imageUrl"
        case readMoreUrl = "readMoreUrl"
        case time = "time"
        case newsUrl = "url"
    }
}
