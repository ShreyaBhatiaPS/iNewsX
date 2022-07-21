//
//  NewsUseCaseTest.swift
//  iNewsXTests
//
//  Created by Shreya Bhatia on 07/07/22.
//

import XCTest
@testable import iNewsX

class NewsUseCaseTest: XCTestCase {
    
    var mocRepository: MockNewsRepository!
    var useCase: NewsUseCaseImp?
    
    override func setUp() {
        super.setUp()
        mocRepository = MockNewsRepository()
        useCase = NewsUseCaseImp(repository: mocRepository)
    }
    
    override func tearDown() {
        super.tearDown()
        mocRepository = nil
        useCase = nil
    }
    
    func testNewsDataSuccess() {
        useCase?.getTheNews(callback: { result in
            switch result {
            case .success(let model):
                XCTAssertTrue(model.data.count >= 1)
            case .failure(let error):
                XCTFail(error.message)
            }
        })
    }
    
    func testNewsDataFailure() {
        mocRepository.news = nil
        useCase?.getTheNews(callback: { result in
            switch result {
            case .success(let model):
                XCTAssertEqual(model.data, nil)
            case .failure(_):
                XCTAssert(true)
            }
        })
    }
}
