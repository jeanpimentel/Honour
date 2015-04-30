//
//  LowercaseTest.swift
//  Honour
//
//  Created by Jean Pimentel on 4/30/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class LowercaseTest: XCTestCase {

    func testValidLowercase() {
        XCTAssertTrue(Lowercase().validate(""))
        XCTAssertTrue(Lowercase().validate("lowercase"))
        XCTAssertTrue(Lowercase().validate("lowercase-with-dashes"))
        XCTAssertTrue(Lowercase().validate("lowercase with spaces"))
        XCTAssertTrue(Lowercase().validate("lowercase with numbers 123"))
        XCTAssertTrue(Lowercase().validate("lowercase with specials characters like ã ç ê"))
        XCTAssertTrue(Lowercase().validate("with specials characters like # $ % & * +"))
        XCTAssertTrue(Lowercase().validate("τάχιστη αλώπηξ βαφής ψημένη γη, δρασκελίζει υπέρ νωθρού κυνός"))
    }

    func testInvalidLowercase() {
        XCTAssertFalse(Lowercase().validate("UPPERCASE"))
        XCTAssertFalse(Lowercase().validate("CamelCase"))
        XCTAssertFalse(Lowercase().validate("First Character Lowercase"))
        XCTAssertFalse(Lowercase().validate("With Numbers 1 2 3"))
    }

}
