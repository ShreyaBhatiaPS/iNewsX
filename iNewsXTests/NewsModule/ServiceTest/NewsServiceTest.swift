//
//  NewsServiceTest.swift
//  iNewsXTests
//
//  Created by Shreya Bhatia on 13/07/22.
//

import XCTest
@testable import iNewsX

class NewsServiceTest: XCTestCase {
    
    var newsService: NewsServiceImpl!
    var mockNetwork: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetwork = MockNetworkManager()
        mockNetwork.newsData = MockData.newsData
        newsService = NewsServiceImpl(network: mockNetwork)
    }
    
    override func tearDown() {
        super.tearDown()
        mockNetwork = nil
        newsService = nil
    }
    
    func testRepositorySuccess() {
        
        newsService.makeNetworkRequest { [weak self] result in
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
        newsService.makeNetworkRequest { result in
            switch result {
            case .success(let model):
                XCTAssertEqual(model.data, nil)
            case .failure(_):
                XCTAssert(true)
            }
        }
    }
}

