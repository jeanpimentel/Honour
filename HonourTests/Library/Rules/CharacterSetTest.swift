//
//  CharacterSetTest.swift
//  Honour
//
//  Created by Jean Fellipe de Almeida Pimentel on 4/16/16.
//  Copyright (c) 2016 Honour. All rights reserved.
//

import XCTest
import Honour

class CharacterSetTest: XCTestCase {
    
    func testValidEntryForCharacterSet() {
        XCTAssertTrue(CharacterSet(NSCharacterSet.letterCharacterSet()).validate("abcdef"))
        XCTAssertTrue(CharacterSet(NSCharacterSet.alphanumericCharacterSet()).validate("abc123"))
        XCTAssertTrue(CharacterSet(NSCharacterSet.decimalDigitCharacterSet()).validate("1234567890"))
    }
    
    func testInvalidEntryForCharacterSet() {
        XCTAssertFalse(CharacterSet(NSCharacterSet.letterCharacterSet()).validate("123"))
        XCTAssertFalse(CharacterSet(NSCharacterSet.alphanumericCharacterSet()).validate("+-=%"))
        XCTAssertFalse(CharacterSet(NSCharacterSet.decimalDigitCharacterSet()).validate("acbdef"))
    }
    
}
