//
//  NewsServiceImpl.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 13/07/22.
//

import Foundation

class NewsServiceImpl: INewsService {
    
    private let network: INetworkManager
    
    init(network: INetworkManager) {
        self.network = network
    }
    
    func makeNetworkRequest(completion: NewsCompletionHandler?){
        let urlString = EndPoint.newsUrl
        let request = BaseRequest(url: urlString, body: nil, method: .GET, header: nil)
        network.executeNetworkRequest(NewsList.self, request: request, completion: completion)
    }
}
