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
        XCTAssertTrue(Multiple(of: 0).validate(0)) // only 0 is multiple of 0
        
        XCTAssertTrue(Multiple(of: 1).validate(-2))
        XCTAssertTrue(Multiple(of: 1).validate(-1))
        XCTAssertTrue(Multiple(of: 1).validate(0))
        XCTAssertTrue(Multiple(of: 1).validate(1))
        XCTAssertTrue(Multiple(of: 1).validate(2))
        
        XCTAssertTrue(Multiple(of: 5).validate(-10))
        XCTAssertTrue(Multiple(of: 5).validate(-5))
        XCTAssertTrue(Multiple(of: 5).validate(0))
        XCTAssertTrue(Multiple(of: 5).validate(5))
        XCTAssertTrue(Multiple(of: 5).validate(10))
        
        XCTAssertTrue(Multiple(of: 3.1).validate(-9.3))
        XCTAssertTrue(Multiple(of: 3.1).validate(12.4))
        XCTAssertTrue(Multiple(of: 3.1).validate(31.0))

        XCTAssertTrue(Multiple(of: -13).validate(273))
        XCTAssertTrue(Multiple(of: 17).validate(-17))
        XCTAssertTrue(Multiple(of: -4).validate(-40))
    }
    
    func testInvalidMultiple() {
        XCTAssertFalse(Multiple(of: 0).validate(-1))
        XCTAssertFalse(Multiple(of: 0).validate(1))
        XCTAssertFalse(Multiple(of: 0).validate(10))
        XCTAssertFalse(Multiple(of: 1.4).validate(11))
        XCTAssertFalse(Multiple(of: -5).validate(1))
        XCTAssertFalse(Multiple(of: 3).validate(7))
        XCTAssertFalse(Multiple(of: 4).validate(-454))
        XCTAssertFalse(Multiple(of: -30).validate(-31))
    }
    
}