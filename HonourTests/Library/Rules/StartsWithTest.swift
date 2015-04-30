//
//  StartsWithTest.swift
//  Honour
//
//  Created by Jean Pimentel on 4/30/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class StartsWithTest: XCTestCase {

    func testStartsWith() {
        XCTAssertTrue(StartsWith(startValue: "").validate(""))
        XCTAssertTrue(StartsWith(startValue: "").validate("foobarbaz"))
        XCTAssertTrue(StartsWith(startValue: "foo").validate("foobarbaz"))
        XCTAssertTrue(StartsWith(startValue: "foo", caseSensitive: true).validate("foobarbaz"))
        XCTAssertTrue(StartsWith(startValue: "foo", caseSensitive: false).validate("FOObarbaz"))
    }

    func testNonStartsWith() {
        XCTAssertFalse(StartsWith(startValue: "foo").validate(""))
        XCTAssertFalse(StartsWith(startValue: "foo").validate("faaborboz"))
        XCTAssertFalse(StartsWith(startValue: "foo", caseSensitive: true).validate("FOObarbaz"))
    }

}
