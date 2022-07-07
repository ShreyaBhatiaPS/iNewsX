//
//  NewsViewModalTest.swift
//  iNewsXTests
//
//  Created by Shreya Bhatia on 06/07/22.
//

import XCTest
@testable import iNewsX

class NewsViewModalTest: XCTestCase {

    var resultImplementation: NewsViewModelResult?
    var news: [NewsData] = []
    var useCase: MockUseCase!
    var newsViewModel: NewsViewModelImpl?
    
    override func setUp() {
        super.setUp()
        useCase = MockUseCase()
        newsViewModel = NewsViewModelImpl(useCase: useCase)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testViewModelSuccess() {
        useCase.news = MockData.newsData
        useCase.getTheNews { [weak self] result in
            switch result {
            case .success(let model):
                XCTAssertEqual(model.data, self?.useCase.news?.data)
                self?.resultImplementation?.success()
            case .failure(let error):
                XCTFail(error.message)
                self?.resultImplementation?.gotError(error)
            }
        }
    }
    
    func testViewModelFailure() {
        useCase.news = nil
        useCase.getTheNews { [weak self] result in
            switch result {
            case .success(let model):
                XCTAssertEqual(model.data, nil)
                self?.resultImplementation?.success()
            case .failure(let error):
                XCTAssert(true)
                self?.resultImplementation?.gotError(error)
            }
        }
    }
}

