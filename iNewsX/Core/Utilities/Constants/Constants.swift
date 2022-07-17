//
//  Constants.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 08/07/22.
//

import Foundation

struct EndPoint {
    static let newsUrl = "https://inshorts.deta.dev/news?category=science"
}

struct ViewControllerConstant {
    static let mainStoryBoard = "Main"
    static let newsVCIdentifier = "NewsViewController"
    static let newsVCFailure = "Could not find view controller with identifier"
    static let newsCollectionViewAccessibilityIdentifier = "NewsCollectionView"
    static let newsCollectionViewCellIdentifier = "NewsCollectionViewCell"
}

struct StringConstant {
    static let okButtonTitle = "OK"
}

enum ErrorString: String {
    case imageURLError = "Error while fetching image from url: "
    case urlFailure = "Failed to get URL"
    
}
