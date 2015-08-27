//
//  MultipleTest.swift
//  Honour
//
//  Created by Filipe Faria on 24/08/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class MultipleTest: XCTestCase {
    
    func testValidMultiple() {
        XCTAssertTrue(Multiple(mult: 3.1).validate(-9.3))
        XCTAssertTrue(Multiple(mult: 5).validate(15))
        XCTAssertTrue(Multiple(mult: 17).validate(-17))
        XCTAssertTrue(Multiple(mult: 1).validate(15))
        XCTAssertTrue(Multiple(mult: -13).validate(273))
        XCTAssertTrue(Multiple(mult: -4).validate(-40))
        XCTAssertTrue(Multiple(mult: 2.5).validate(12.5))
    }
    
    func testInvalidMultiple() {
        XCTAssertFalse(Multiple(mult: 0).validate(10))
        XCTAssertFalse(Multiple(mult: 1.4).validate(11))
        XCTAssertFalse(Multiple(mult: -5).validate(1))
        XCTAssertFalse(Multiple(mult: 3).validate(7))
        XCTAssertFalse(Multiple(mult: 7).validate(0))
        XCTAssertFalse(Multiple(mult: 4).validate(-454))
        XCTAssertFalse(Multiple(mult: -30).validate(-31))
    }
    
}