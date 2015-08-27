//
//  MaxTest.swift
//  Honour
//
//  Created by Jean Pimentel on 7/27/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class MaxTest: XCTestCase {

    func testValidMax() {
        XCTAssertTrue(Max(max: 500).validate(400))
        XCTAssertTrue(Max(max: 500).validate(500))
        XCTAssertTrue(Max(max: 0.5, inclusive: false).validate(0.4999))
        
        let sameDate = NSDate()
        XCTAssertTrue(Max(max: sameDate).validate(sameDate))
        XCTAssertTrue(Max(max: NSDate()).validate(NSDate(timeIntervalSinceNow: -86400)))
        XCTAssertTrue(Max(max: NSDate()).validate(NSDate(timeIntervalSinceNow: -1)))
        XCTAssertTrue(Max(max: NSDate(timeIntervalSince1970: 1440636124), inclusive: false).validate(NSDate(timeIntervalSince1970: 1440636123)))
        
    }

    func testInvalidMax() {
        XCTAssertFalse(Max(max: 500).validate(501))
        XCTAssertFalse(Max(max: 500, inclusive: false).validate(500))
        XCTAssertFalse(Max(max: 500, inclusive: false).validate(501))
        XCTAssertFalse(Max(max: 1, inclusive: false).validate(1.001))
        XCTAssertFalse(Max(max: 0.5, inclusive: false).validate(0.500))
        
        XCTAssertFalse(Max(max: NSDate()).validate(NSDate(timeIntervalSinceNow: +86400)))
        XCTAssertFalse(Max(max: NSDate()).validate(NSDate(timeIntervalSinceNow: +1)))
        XCTAssertFalse(Max(max: NSDate(timeIntervalSince1970: 1440636123), inclusive: false).validate(NSDate(timeIntervalSince1970: 1440636123)))
    }
    
}