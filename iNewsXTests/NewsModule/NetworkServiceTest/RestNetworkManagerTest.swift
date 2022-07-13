//
//  RestNetworkManagerTest.swift
//  iNewsXTests
//
//  Created by Shreya Bhatia on 07/07/22.
//

import XCTest
@testable import iNewsX

class RestNetworkManagerTest: XCTestCase {
    
    var networkManager: INetworkManager!
    
    override func setUp() {
        super.setUp()
        networkManager = RestNetworkManager()
    }
    
    func testNetworkClassSuccess() {
        let expectation = expectation(description: "Successfully called the network")

        let baseRequest = BaseRequest(url: "https://inshorts.deta.dev/news?category=science", body: nil, method: .GET, header: nil)
        networkManager.executeNetworkRequest(NewsList.self, request: baseRequest) { result in
            switch result {
            case .success(let model):
                XCTAssertTrue(model.data.count > 1)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Unexpected error: \(error.message)")
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testNetworkClassURLFailure() {
        let expectation = expectation(description: "Failed to call the url")
        let baseRequest = BaseRequest(url: "abc.com/..", body: nil, method: .GET, header: nil)
        networkManager.executeNetworkRequest(NewsList.self, request: baseRequest) { result in
            switch result {
            case .success(_):
                XCTFail("got the data in failed test case")
            case .failure(_):
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
}
