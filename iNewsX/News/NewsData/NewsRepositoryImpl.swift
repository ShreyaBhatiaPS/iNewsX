//
//  NewsRepositoryImpl.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 06/07/22.
//

import Foundation

class NewsRepositoryImpl: INewsRepository {
    
    let network: INetworkManager!
    
    init(network: INetworkManager) {
        self.network = network
    }
    
    func makeNetworkCallToGetNews(completion: NewsCompletionHandler?) {
        let urlString = "https://inshorts.deta.dev/news?category=science"
        let request = BaseRequest(url: urlString, body: nil, method: .GET, header: nil)
        network.executeNetworkRequest(News.self, request: request, completion: completion)
    }
    
    
}
