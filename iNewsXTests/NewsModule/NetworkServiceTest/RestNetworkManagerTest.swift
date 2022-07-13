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
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)
        networkManager = RestNetworkManager(session: urlSession)
    }
    
    func testNetworkClassSuccess() {
        let expectation = expectation(description: "Successfully called the network")
        
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url else {
                throw NSError(domain: "URL", code: NSURLErrorBadURL, userInfo: nil)
            }
            
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, MockData.encodedDictionary())
        }

        let baseRequest = BaseRequest(url: "abc.com", body: nil, method: .GET, header: nil)
        networkManager.executeNetworkRequest(NewsList.self, request: baseRequest) { result in
            switch result {
            case .success(let model):
                XCTAssertTrue(model.data.count >= 1)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Unexpected error: \(error.message)")
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testNetworkClassURLFailure() {
        let expectation = expectation(description: "Failed to call the url")
        
        // Creating nil data
        let data = Data()
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url else {
                throw NSError(domain: "URL", code: NSURLErrorBadURL, userInfo: nil)
            }
            
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        let baseRequest = BaseRequest(url: "abc.com/..", body: nil, method: .GET, header: nil)
        networkManager.executeNetworkRequest(NewsList.self, request: baseRequest) { result in
            switch result {
            case .success(_):
                XCTFail("got the data in failed test case")
            case .failure(_):
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
}
