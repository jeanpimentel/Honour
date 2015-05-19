//
//  AlwaysInvalidTest.swift
//  Honour
//
//  Created by Jean Pimentel on 5/18/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class AlwaysInvalidTest: XCTestCase {

    func testAlwaysInvalid() {
        XCTAssertFalse(AlwaysInvalid().validate(""))
        XCTAssertFalse(AlwaysInvalid().validate("a"))
        XCTAssertFalse(AlwaysInvalid().validate("1"))
        XCTAssertFalse(AlwaysInvalid().validate("   "))
    }
    
}
