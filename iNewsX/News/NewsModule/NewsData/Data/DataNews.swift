//
//  DomainData.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 13/07/22.
//

import Foundation

// MARK: - Data Transfer Object (DTO)
// It is used as intermediate object to encode/decode JSON response into domain, inside DataLayer

struct NewsDTO: Codable, Equatable {
    var data: [NewsDataDTO]
}

struct NewsDataDTO: Codable, Equatable {
    let title, content, date, imageUrl: String
}


// Mapping Data to Domain

extension NewsDTO {
    
    func toDomain() -> DomainNewsList {
        return .init(data: data.map({$0.toDomain()}))
    }
}

extension NewsDataDTO {
    func toDomain() -> DomainNewsData {
        return .init(title: self.title,
                     content: self.content,
                     date: self.date,
                     imageUrl: self.imageUrl)
    }
}
