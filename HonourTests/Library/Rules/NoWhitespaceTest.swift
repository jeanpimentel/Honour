//
//  NoWhitespaceTest.swift
//  Honour
//
//  Created by Jean Pimentel on 5/18/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class NoWhitespaceTest: XCTestCase {

    func testValidNoWhitespace() {
        XCTAssertTrue(NoWhitespace().validate(""))
        XCTAssertTrue(NoWhitespace().validate("foobar"))
    }

    func testInvalidNoWhitespace() {
        XCTAssertFalse(NoWhitespace().validate(" "))
        XCTAssertFalse(NoWhitespace().validate("\n"))
        XCTAssertFalse(NoWhitespace().validate("foo "))
        XCTAssertFalse(NoWhitespace().validate(" foo "))
        XCTAssertFalse(NoWhitespace().validate(" foo"))
        XCTAssertFalse(NoWhitespace().validate("foo bar"))
        XCTAssertFalse(NoWhitespace().validate("foo\nbar"))
        XCTAssertFalse(NoWhitespace().validate("foo\tbar"))
        XCTAssertFalse(NoWhitespace().validate("foo\rbar"))
    }

}
