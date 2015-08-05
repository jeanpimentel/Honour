//
//  OddTest.swift
//  Honour
//
//  Created by Jean Pimentel on 8/5/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class OddTest: XCTestCase {

    func testValidOdd() {
//        XCTAssertTrue(Odd().validate(1))
//        XCTAssertTrue(Odd().validate(3))
//        XCTAssertTrue(Odd().validate(11))
//        XCTAssertTrue(Odd().validate(1001))
        XCTAssertTrue(Odd().validate(-11))
    }

    func testInvalidOdd() {
        XCTAssertFalse(Odd().validate(0))
        XCTAssertFalse(Odd().validate(2))
        XCTAssertFalse(Odd().validate(910))
        XCTAssertFalse(Odd().validate(-4))
        XCTAssertFalse(Odd().validate(2.3))
    }
    
}