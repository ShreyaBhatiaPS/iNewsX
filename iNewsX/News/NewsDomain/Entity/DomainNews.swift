//
//  News.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 04/07/22.
//

import Foundation

struct DomainNewsList: Equatable {
    var data: [DomainNewsData] = []
}

struct DomainNewsData: Equatable {
    let title, content, date, imageUrl: String
}

// Mapping Data

extension DomainNewsList {
    
    func toPresentation() -> NewsList {
        return .init(data: data.map({$0.toPresentation()}))
    }
}

extension DomainNewsData {
    func toPresentation() -> NewsData {
        return .init(title: self.title,
                     content: self.content,
                     date: self.date,
                     imageUrl: self.imageUrl)
    }
}
