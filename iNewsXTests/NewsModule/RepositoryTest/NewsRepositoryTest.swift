//
//  NewsRepositoryTest.swift
//  iNewsXTests
//
//  Created by Shreya Bhatia on 07/07/22.
//

import XCTest
@testable import iNewsX

class NewsRepositoryTest: XCTestCase {
    
    var newsRepository: NewsRepositoryImpl!
    var mockNetwork: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetwork = MockNetworkManager()
        mockNetwork.newsData = MockData.newsData
        newsRepository = NewsRepositoryImpl(network: mockNetwork)
    }
    
    override func tearDown() {
        super.tearDown()
        mockNetwork = nil
        newsRepository = nil
    }
    
    func testRepositorySuccess() {
        newsRepository.makeNetworkCallToGetNews { [weak self] result in
            switch result {
            case .success(let model):
                XCTAssertEqual(model.data, self?.mockNetwork.newsData?.data)
            case .failure(let error):
                XCTFail(error.message)
            }
        }
        
    }
    
    func testRepositoryFailure() {
        mockNetwork.newsData = nil
        newsRepository.makeNetworkCallToGetNews { result in
            switch result {
            case .success(let model):
                XCTAssertEqual(model.data, nil)
            case .failure(_):
                XCTAssert(true)
            }
        }
    }
}
