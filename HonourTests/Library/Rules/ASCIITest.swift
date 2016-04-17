//
//  ASCIITest.swift
//  Honour
//
//  Created by Jean Fellipe de Almeida Pimentel on 4/16/16.
//  Copyright (c) 2016 Honour. All rights reserved.
//

import XCTest
import Honour

class ASCIITest: XCTestCase {
    
    func testValidEntryForASCII() {
        XCTAssertTrue(ASCII().validate("abcdef"))
        XCTAssertTrue(ASCII().validate("ABCDEF"))
        XCTAssertTrue(ASCII().validate("@^?%#"))
    }
    
    func testInvalidEntryForASCII() {
        XCTAssertFalse(ASCII().validate("âíõ"))
        XCTAssertFalse(ASCII().validate("ç"))
        XCTAssertFalse(ASCII().validate("©"))
        XCTAssertFalse(ASCII().validate("αßγ"))
    }
    
}
