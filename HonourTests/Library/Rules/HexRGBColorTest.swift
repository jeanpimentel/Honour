//
//  HexRGBColorTest.swift
//  Honour
//
//  Created by Jean Pimentel on 7/23/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class HexRGBColorTest: XCTestCase {

    func testValidHexRGBColor() {
        XCTAssertTrue(HexRGBColor().validate("#000"))
        XCTAssertTrue(HexRGBColor().validate("#00000F"))
        XCTAssertTrue(HexRGBColor().validate("#123"))
        XCTAssertTrue(HexRGBColor().validate("#CCC"))
        XCTAssertTrue(HexRGBColor().validate("#123456"))
        XCTAssertTrue(HexRGBColor().validate("#FFFFFF"))
        XCTAssertTrue(HexRGBColor().validate("#123123"))
        XCTAssertTrue(HexRGBColor().validate("#FFFFFF"))
        XCTAssertTrue(HexRGBColor().validate("000"))
        XCTAssertTrue(HexRGBColor().validate("00000F"))
        XCTAssertTrue(HexRGBColor().validate("123"))
        XCTAssertTrue(HexRGBColor().validate("CCC"))
        XCTAssertTrue(HexRGBColor().validate("123456"))
        XCTAssertTrue(HexRGBColor().validate("FFFFFF"))
        XCTAssertTrue(HexRGBColor().validate("123123"))
        XCTAssertTrue(HexRGBColor().validate("FFFFFF"))
    }

    func testInvalidHexRGBColor() {
        XCTAssertFalse(HexRGBColor().validate(""))
        XCTAssertFalse(HexRGBColor().validate("#0"))
        XCTAssertFalse(HexRGBColor().validate("#0000G0"))
        XCTAssertFalse(HexRGBColor().validate("#0FG"))
        XCTAssertFalse(HexRGBColor().validate("#1234"))
        XCTAssertFalse(HexRGBColor().validate("#AAAAAA1"))
        XCTAssertFalse(HexRGBColor().validate("#S"))
        XCTAssertFalse(HexRGBColor().validate("1234"))
        XCTAssertFalse(HexRGBColor().validate("foo"))
    }
    
}
