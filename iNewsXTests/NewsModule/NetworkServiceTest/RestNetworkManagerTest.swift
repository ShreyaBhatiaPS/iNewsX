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
        
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url else {
                throw BaseErrorClass(message: "Failed to load url")
            }
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, MockData.encodeData())
        }
        
        let baseRequest = BaseRequest(url: "https://inshorts.deta.dev/news?category=science", body: nil, method: .GET, header: nil)
        networkManager.executeNetworkRequest(News.self, request: baseRequest) { result in
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
        networkManager.executeNetworkRequest(News.self, request: baseRequest) { result in
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
