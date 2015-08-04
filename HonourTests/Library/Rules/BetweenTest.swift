//
//  BetweenTest.swift
//  Honour
//
//  Created by Jean Pimentel on 7/27/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class BetweenTest: XCTestCase {

    func testValidBetween() {
        XCTAssertTrue(Between(min: 0, max: 0).validate(0))
        XCTAssertTrue(Between(min: 0, max: 1).validate(0))
        XCTAssertTrue(Between(min: 0, max: 1).validate(0.5))
        XCTAssertTrue(Between(min: 0, max: 1).validate(1))
        XCTAssertTrue(Between(min: -1, max: 0).validate(-0.5))
        XCTAssertTrue(Between(min: -10, max: -4).validate(-5))
    }

    func testInvalidBetween() {
        XCTAssertFalse(Between(min: 0, max: 0).validate(0.1))
        XCTAssertFalse(Between(min: 0, max: 1).validate(1.001))
        XCTAssertFalse(Between(min: 0, max: 0, inclusive: false).validate(0))
        XCTAssertFalse(Between(min: 0, max: 1, inclusive: false).validate(1))
        XCTAssertFalse(Between(min: -1, max: 0, inclusive: false).validate(-1))
        XCTAssertFalse(Between(min: -10, max: -4, inclusive: false).validate(-4))
    }
    
}