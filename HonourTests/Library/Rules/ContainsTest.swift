//
//  ContainsTest.swift
//  Honour
//
//  Created by Jean Pimentel on 4/30/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class ContainsTest: XCTestCase {

    func testContains() {
        XCTAssertTrue(Contains(value: "").validate(""))
        XCTAssertTrue(Contains(value: "").validate("foobarbaz"))
        XCTAssertTrue(Contains(value: "foo").validate("foobarbaz"))
        XCTAssertTrue(Contains(value: "foo").validate("barfoobaz"))
        XCTAssertTrue(Contains(value: "foo").validate("barbazfoo"))
        XCTAssertTrue(Contains(value: "foo", caseSensitive: true).validate("foobarbaz"))
        XCTAssertTrue(Contains(value: "foo", caseSensitive: false).validate("FOObarbaz"))
    }

    func testNonContains() {
        XCTAssertFalse(Contains(value: "foo").validate(""))
        XCTAssertFalse(Contains(value: "foo").validate("faaborboz"))
        XCTAssertFalse(Contains(value: "foo", caseSensitive: true).validate("FOObarbaz"))
    }
    
}
