//
//  RomanTest.swift
//  Honour
//
//  Created by Jean Pimentel on 5/18/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class RomanTest: XCTestCase {

    func testValidEntryForRoman() {
        XCTAssertTrue(Roman().validate("III"))
        XCTAssertTrue(Roman().validate("IV"))
        XCTAssertTrue(Roman().validate("VI"))
        XCTAssertTrue(Roman().validate("XIX"))
        XCTAssertTrue(Roman().validate("XLII"))
        XCTAssertTrue(Roman().validate("LXII"))
        XCTAssertTrue(Roman().validate("CXLIX"))
        XCTAssertTrue(Roman().validate("CLIII"))
        XCTAssertTrue(Roman().validate("MCCXXXIV"))
        XCTAssertTrue(Roman().validate("MMXXIV"))
        XCTAssertTrue(Roman().validate("MCMLXXV"))
        XCTAssertTrue(Roman().validate("MMMMCMXCIX"))
    }

    func testInvalidEntryForRoman() {
        XCTAssertFalse(Roman().validate("IIII"))
        XCTAssertFalse(Roman().validate("IVVVX"))
        XCTAssertFalse(Roman().validate("CCDC"))
        XCTAssertFalse(Roman().validate("MXM"))
        XCTAssertFalse(Roman().validate("XIIIIIIII"))
        XCTAssertFalse(Roman().validate("MIMIMI"))
    }
    
}
