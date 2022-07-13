//
//  News.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 04/07/22.
//

import Foundation

//typealias News = [NewsData]

struct NewsList: Codable, Equatable {
    var data: [NewsData] = []
}


struct DataNewsList: Codable, Equatable {
    var data: [DataNews] = []
}

struct DataNews: Codable, Equatable {
    var title, content, date: String
    var imageUrl: String
}



struct NewsData: Codable, Equatable {
    let title, description, publishedDate: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "content"
        case publishedDate = "date"
        case imageUrl = "imageUrl"
    }
}
