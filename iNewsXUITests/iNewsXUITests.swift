//
//  iNewsXUITests.swift
//  iNewsXUITests
//
//  Created by Shreya Bhatia on 04/07/22.
//

import XCTest

class iNewsXUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testCollectionView() throws {
        // UI tests must launch the application that they test.
        app.launch()

        let expectation = expectation(description: "Wait for collection view cells")
        let newsCollectionView = app.collectionViews.matching(identifier: "NewsCollectionView")
        
        let collectionViewCells = newsCollectionView.cells
        XCTAssert(collectionViewCells.element.waitForExistence(timeout: 10.0))
        
        if collectionViewCells.count > 0 {
            
            expectation.fulfill()
            waitForExpectations(timeout: 20, handler: nil)
            XCTAssertTrue(true, "Collection view validations finished")
            
        } else {
            XCTAssert(false, "Could'nt find collection view cells")
        }
    }

}

