//
//  NegativeTest.swift
//  Honour
//
//  Created by Jean Pimentel on 8/4/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class NegativeTest: XCTestCase {

    func testValidNegative() {
        XCTAssertTrue(Negative().validate(-1))
        XCTAssertTrue(Negative().validate(-0.001))
        XCTAssertTrue(Negative().validate(-100))
    }

    func testInvalidNegative() {
        XCTAssertFalse(Negative().validate(-0))
        XCTAssertFalse(Negative().validate(-0.0))
        XCTAssertFalse(Negative().validate(0))
        XCTAssertFalse(Negative().validate(0.0))
        XCTAssertFalse(Negative().validate(0.001))
        XCTAssertFalse(Negative().validate(100))
    }
    
}