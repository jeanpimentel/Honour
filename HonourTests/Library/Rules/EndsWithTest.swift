//
//  EndsWithTest.swift
//  Honour
//
//  Created by Jean Pimentel on 4/30/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class EndsWithTest: XCTestCase {

    func testEndsWith() {
        XCTAssertTrue(EndsWith(endValue: "").validate(""))
        XCTAssertTrue(EndsWith(endValue: "").validate("foobarbaz"))
        XCTAssertTrue(EndsWith(endValue: "foo").validate("barbazfoo"))
        XCTAssertTrue(EndsWith(endValue: "foo", caseSensitive: true).validate("barbazfoo"))
        XCTAssertTrue(EndsWith(endValue: "foo", caseSensitive: false).validate("barbazFOO"))
        XCTAssertTrue(EndsWith("").validate(""))
        XCTAssertTrue(EndsWith("foo", caseSensitive: true).validate("barbazfoo"))
    }

    func testNonEndsWith() {
        XCTAssertFalse(EndsWith(endValue: "foo").validate(""))
        XCTAssertFalse(EndsWith(endValue: "foo").validate("borbozfaa"))
        XCTAssertFalse(EndsWith(endValue: "foo", caseSensitive: true).validate("barbazFOO"))
    }

}
