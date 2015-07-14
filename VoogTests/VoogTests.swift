//
//  VoogTests.swift
//  VoogTests
//
//  Created by Priit Haamer on 12.07.15.
//  Copyright © 2015 Voog. All rights reserved.
//

import XCTest
import Voog
import Nocilla

class VoogTests: XCTestCase {
    
    var client: VoogClient? = nil
    
    override func setUp() {
        super.setUp()
        
        LSNocilla.sharedInstance().start()
        
        self.client = VoogClient(host: "voog.test", apiKey: "bc6feb11c1f953b7db0664e52384a200")
    }
    
    override func tearDown() {
        super.tearDown()
        
        LSNocilla.sharedInstance().stop()
        LSNocilla.sharedInstance().clearStubs()
    }
    
    func getJSONMock(resource: String) -> String {
        let fileURL = NSBundle(forClass: self.dynamicType).URLForResource(resource, withExtension: "json")
        
        do {
            return try NSString(contentsOfURL: fileURL!, encoding: NSUTF8StringEncoding) as String
        } catch {
            return ""
        }
    }
    
    func testLanguages() {
        let expectation = self.expectationWithDescription("Fetch languages")
        
        stubRequest("GET", "http://voog.test/admin/api/languages").andReturn(200).withBody(getJSONMock("languages"))
        
        self.client?.languages() {
            XCTAssertEqual($0.count, 2, "Languages count")
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(2.0, handler: nil)
    }
    
    func testLayouts() {
        let expectation = self.expectationWithDescription("Fetch layouts")
        
        stubRequest("GET", "http://voog.test/admin/api/layouts").andReturn(200).withBody(getJSONMock("layouts"))
        
        self.client?.layouts() {
            XCTAssertEqual($0.count, 2, "Layouts count")
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(2.0, handler: nil)
    }
    
    func testLayout() {
        let expectation = self.expectationWithDescription("Fetch layout")
        
        stubRequest("GET", "http://voog.test/admin/api/layouts/2").andReturn(200).withBody(getJSONMock("layout"))
        
        self.client?.layout(2) {
            XCTAssertEqual($0.id, 2, "Layout ID")
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(2.0, handler: nil)
    }
    
}
