//
//  LengthTest.swift
//  Honour
//
//  Created by Jean Pimentel on 4/30/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class LengthTest: XCTestCase {

    func testValidLength() {
        XCTAssertTrue(Length(min: 1, max: 12).validate("jeanpimentel"))
        XCTAssertTrue(Length(min: 4, max: 6).validate("ççççç"))
        XCTAssertTrue(Length(min: 1, max: 30).validate("               "))
        XCTAssertTrue(Length(min: 1).validate("jeanpimentel"))
        XCTAssertTrue(Length(max: 12).validate("jeanpimentel"))
        XCTAssertTrue(Length(max: 15).validate("jeanpimentel"))
    }

    func testInvalidLength() {
        XCTAssertFalse(Length(min: 1, max: 4).validate(""))
        XCTAssertFalse(Length(min: 1, max: 3).validate("jeanpimentel"))
        XCTAssertFalse(Length(min: 15).validate("jeanpimentel"))
        XCTAssertFalse(Length(max: 10).validate("jeanpimentel"))
    }

}
