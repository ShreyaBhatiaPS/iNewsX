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
    var mockService: MockService!
    
    override func setUp() {
        super.setUp()
        mockService = MockService()
        mockService.newsData = MockData.newsDTO
        newsRepository = NewsRepositoryImpl(service: mockService)
    }
    
    override func tearDown() {
        super.tearDown()
        mockService = nil
        newsRepository = nil
    }
    
    func testRepositorySuccess() {
        newsRepository.makeServiceCall { [weak self] result in
            switch result {
            case .success(let model):
                
                XCTAssertEqual(model.data, self?.mockService.newsData?.toDomain().data)
            case .failure(let error):
                XCTFail(error.message)
            }
        }
    }
    
    func testRepositoryFailure() {
        mockService.newsData = nil
        newsRepository.makeServiceCall { result in
            switch result {
            case .success(let model):
                XCTAssertEqual(model.data, nil)
            case .failure(_):
                XCTAssert(true)
            }
        }
    }
    
}
