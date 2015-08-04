//
//  PositiveTest.swift
//  Honour
//
//  Created by Jean Pimentel on 8/4/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class PositiveTest: XCTestCase {

    func testValidPositive() {
        XCTAssertTrue(Positive().validate(1))
        XCTAssertTrue(Positive().validate(0.001))
        XCTAssertTrue(Positive().validate(100))
    }

    func testInvalidPositive() {
        XCTAssertFalse(Positive().validate(0))
        XCTAssertFalse(Positive().validate(0.0))
        XCTAssertFalse(Positive().validate(-0.0))
        XCTAssertFalse(Positive().validate(-0.001))
    }
    
}