//
//  VoogTests.swift
//  VoogTests
//
//  Created by Priit Haamer on 12.07.15.
//  Copyright © 2015 Voog. All rights reserved.
//

import XCTest
import Voog

class VoogTests: XCTestCase {
    
    var client: VoogClient? = nil
    
    override func setUp() {
        super.setUp()
        
        self.client = VoogClient(host: "priit.voog.computer", apiKey: "bc6feb11c1f953b7db0664e52384a200")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLanguages() {
        let expectation = self.expectationWithDescription("Fetch languages")
        
        self.client?.languages() {
            XCTAssertEqual($0.count, 5, "Length")
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5.0, handler: nil)
    }
    
    func testLayouts() {
        let expectation = self.expectationWithDescription("Fetch languages")
        
        self.client?.layouts() {
            XCTAssertEqual($0.count, 22, "Layouts count")
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5.0, handler: nil)
    }
    
}
