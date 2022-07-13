//
//  MockData.swift
//  iNewsXTests
//
//  Created by Shreya Bhatia on 06/07/22.
//

import Foundation

struct MockData {
    static let newsData: NewsList = NewsList(data: [NewsData(title: "Weather Update",
                                                             content: "Heavy rainfall in some areas",
                                                             date: "Thursday, 21st June, 2022",
                                                         imageUrl: "getimage.com")])
    
    static func encodedDictionary() -> Data {
        let encoded = try! JSONEncoder().encode(newsData)
        return encoded
    }
}
