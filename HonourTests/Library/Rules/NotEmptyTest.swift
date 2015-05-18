//
//  NotEmptyTest.swift
//  Honour
//
//  Created by Jean Pimentel on 5/18/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class NotEmptyTest: XCTestCase {

    func testValidNotEmpty() {
        XCTAssertTrue(NotEmpty().validate("foobar"))
        XCTAssertTrue(NotEmpty().validate("foo bar"))
    }

    func testInvalidNotEmpty() {
        XCTAssertFalse(NotEmpty().validate(""))
        XCTAssertFalse(NotEmpty().validate(" "))
        XCTAssertFalse(NotEmpty().validate("\n"))
        XCTAssertFalse(NotEmpty().validate("\t"))
        XCTAssertFalse(NotEmpty().validate("\n "))
        XCTAssertFalse(NotEmpty().validate("     "))
    }

}
