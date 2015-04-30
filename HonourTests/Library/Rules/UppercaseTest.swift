//
//  UppercaseTest.swift
//  Honour
//
//  Created by Jean Pimentel on 4/30/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class UppercaseTest: XCTestCase {

    func testValidUppercase() {
        XCTAssertTrue(Uppercase().validate(""))
        XCTAssertTrue(Uppercase().validate("UPPERCASE"))
        XCTAssertTrue(Uppercase().validate("UPPERCASE-WITH-DASHES"))
        XCTAssertTrue(Uppercase().validate("UPPERCASE WITH SPACES"))
        XCTAssertTrue(Uppercase().validate("UPPERCASE WITH NUMBERS 123"))
        XCTAssertTrue(Uppercase().validate("UPPERCASE WITH SPECIALS CHARACTERS LIKE Ã Ç Ê"))
        XCTAssertTrue(Uppercase().validate("WITH SPECIALS CHARACTERS LIKE # $ % & * +"))
        XCTAssertTrue(Uppercase().validate("ΤΆΧΙΣΤΗ ΑΛΏΠΗΞ ΒΑΦΉΣ ΨΗΜΈΝΗ ΓΗ, ΔΡΑΣΚΕΛΊΖΕΙ ΥΠΈΡ ΝΩΘΡΟΎ ΚΥΝΌΣ"))
    }

    func testInvalidUppercase() {
        XCTAssertFalse(Uppercase().validate("lowercase"))
        XCTAssertFalse(Uppercase().validate("CamelCase"))
        XCTAssertFalse(Uppercase().validate("First Character Uppercase"))
        XCTAssertFalse(Uppercase().validate("With Numbers 1 2 3"))
    }

}
