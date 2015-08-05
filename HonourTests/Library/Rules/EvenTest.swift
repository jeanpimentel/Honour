//
//  EvenTest.swift
//  Honour
//
//  Created by Jean Pimentel on 8/5/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class EvenTest: XCTestCase {

    func testValidEven() {
        XCTAssertTrue(Even().validate(0))
        XCTAssertTrue(Even().validate(2))
        XCTAssertTrue(Even().validate(12))
        XCTAssertTrue(Even().validate(1000))
        XCTAssertTrue(Even().validate(-10))
    }

    func testInvalidEven() {
        XCTAssertFalse(Even().validate(1))
        XCTAssertFalse(Even().validate(3))
        XCTAssertFalse(Even().validate(913))
        XCTAssertFalse(Even().validate(-3))
        XCTAssertFalse(Even().validate(2.4))
    }
    
}