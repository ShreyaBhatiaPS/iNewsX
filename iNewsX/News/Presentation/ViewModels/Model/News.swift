//
//  News.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 13/07/22.
//
import Foundation

struct NewsList: Equatable {
    var data: [NewsData]
}

struct NewsData: Equatable {
    let title, content, date, imageUrl: String
}


