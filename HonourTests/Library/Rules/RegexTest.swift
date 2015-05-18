//
//  RegexTest.swift
//  Honour
//
//  Created by Jean Pimentel on 5/18/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class RegexTest: XCTestCase {

    func testValidEntryForRegex() {

        XCTAssertTrue(Regex(regex: "^[a-z]+$").validate("foobar"))
        XCTAssertTrue(Regex(regex: "^[a-zA-Z]+$").validate("foobar"))
        XCTAssertTrue(Regex(regex: "^[a-z]+$", caseInsensitive: true).validate("foobar"))

        XCTAssertTrue(Regex(regex: "^#?([a-f0-9]{6}|[a-f0-9]{3})$").validate("#ff0000"))
        XCTAssertTrue(Regex(regex: "^#?([a-f0-9]{6}|[a-f0-9]{3})$").validate("#f00"))

        XCTAssertTrue(Regex(regex: "^#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$").validate("#FF00cc"))
        XCTAssertTrue(Regex(regex: "^#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$").validate("#F0c"))

        XCTAssertTrue(Regex(regex: "^#?([a-f0-9]{6}|[a-f0-9]{3})$", caseInsensitive: true).validate("#Ff00Cc"))
        XCTAssertTrue(Regex(regex: "^#?([a-f0-9]{6}|[a-f0-9]{3})$", caseInsensitive: true).validate("#f0C"))

    }

    func testInvalidEntryForRegex() {
        XCTAssertFalse(Regex(regex: "^#?([a-f0-9]{6}|[a-f0-9]{3})$").validate(""))
        XCTAssertFalse(Regex(regex: "^[a-z]+$").validate("fooBar"))
        XCTAssertFalse(Regex(regex: "^#?([a-f0-9]{6}|[a-f0-9]{3})$").validate("#FF0000"))
        XCTAssertFalse(Regex(regex: "^#?([a-f0-9]{6}|[a-f0-9]{3})$").validate("#F00"))
    }
    
}
