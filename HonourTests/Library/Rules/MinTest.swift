//
//  MinTest.swift
//  Honour
//
//  Created by Jean Pimentel on 7/27/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class MinTest: XCTestCase {

    func testValidMin() {
        XCTAssertTrue(Min(min: 500).validate(1000))
        XCTAssertTrue(Min(min: 500).validate(500))
        XCTAssertTrue(Min(min: 0.5, inclusive: false).validate(0.5001))
        
        XCTAssertTrue(Min(min: NSDate()).validate(NSDate()))
        XCTAssertTrue(Min(min: NSDate(timeIntervalSinceNow: -86400)).validate(NSDate()))
        XCTAssertTrue(Min(min: NSDate(timeIntervalSinceNow: -1)).validate(NSDate()))
        XCTAssertTrue(Min(min: NSDate(timeIntervalSince1970: 1440636123), inclusive: false).validate(NSDate(timeIntervalSince1970: 1440636124)))
    }

    func testInvalidMin() {
        XCTAssertFalse(Min(min: 500).validate(499))
        XCTAssertFalse(Min(min: 500, inclusive: false).validate(500))
        XCTAssertFalse(Min(min: 500, inclusive: false).validate(499))
        XCTAssertFalse(Min(min: 1, inclusive: false).validate(0.999))
        XCTAssertFalse(Min(min: 0.5, inclusive: false).validate(0.500))
        
        XCTAssertFalse(Min(min: NSDate()).validate(NSDate(timeIntervalSinceNow: -1)))
        XCTAssertFalse(Min(min: NSDate()).validate(NSDate(timeIntervalSinceNow: -86400)))
        XCTAssertFalse(Min(min: NSDate(timeIntervalSince1970: 1440636123), inclusive: false).validate(NSDate(timeIntervalSince1970: 1440636123)))
    }
    
}