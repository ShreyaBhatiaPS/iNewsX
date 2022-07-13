//
//  NewsViewModalTest.swift
//  iNewsXTests
//
//  Created by Shreya Bhatia on 06/07/22.
//

import XCTest
@testable import iNewsX

class NewsViewModalTest: XCTestCase {

    private var expectation: XCTestExpectation!
    var useCase: MockUseCase!
    var newsViewModel: NewsViewModelImpl?
    
    override func setUp() {
        super.setUp()
        useCase = MockUseCase()
        newsViewModel = NewsViewModelImpl(useCase: useCase, resultDelegate: self)
    }
    
    override func tearDown() {
        super.tearDown()
        useCase = nil
        newsViewModel = nil
    }
    
    func testViewModelSuccess() {
        expectation = expectation(description: "Successfully launched the view model")
        useCase.news = MockData.newsDTO
        newsViewModel?.fetchNews()
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testViewModelFailure() {
        expectation = expectation(description: "Failed to launch View model")
        useCase.error = BaseErrorClass(message: "Failed to launch View model")
        newsViewModel?.fetchNews()
        wait(for: [expectation], timeout: 10.0)
    }
}

extension NewsViewModalTest: NewsViewModelResult {
    
    func success() {
        expectation.fulfill()
    }
    
    func gotError(_ error: BaseErrorClass) {
        XCTAssertTrue(error == BaseErrorClass(message: "Failed to launch View model"))
        expectation.fulfill()
    }
    
}
