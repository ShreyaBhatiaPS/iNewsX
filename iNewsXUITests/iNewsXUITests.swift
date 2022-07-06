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

    func testCollectionView() throws {
        // UI tests must launch the application that they test.
        app.launch()

        let newsCollectionView = app.collectionViews.matching(identifier: "NewsCollectionView")
        
        let collectionViewCells = newsCollectionView.cells
        XCTAssert(collectionViewCells.element.waitForExistence(timeout: 5.0))
        
        if collectionViewCells.count > 0 {
            let count: Int = (collectionViewCells.count - 1)
            
            let expectation = expectation(description: "Wait for collection view cells")
            
            for index in stride(from: 0, to: count, by: 1) {
                let cell = collectionViewCells.element(boundBy: index)
                XCTAssertTrue(cell.waitForExistence(timeout: 2.0), "The \(index) cell is present in collection view")
                
                if index == (count - 1) {
                    expectation.fulfill()
                }
            }
            
            waitForExpectations(timeout: 20, handler: nil)
            XCTAssertTrue(true, "Collection view validations finished")
        } else {
            XCTAssert(false, "Could'nt find collection view cells")
        }
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
