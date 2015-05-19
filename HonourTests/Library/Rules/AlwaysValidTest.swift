//
//  AlwaysValidTest.swift
//  Honour
//
//  Created by Jean Pimentel on 5/18/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class AlwaysValidTest: XCTestCase {

    func testAlwaysValid() {
        XCTAssertTrue(AlwaysValid().validate(""))
        XCTAssertTrue(AlwaysValid().validate("a"))
        XCTAssertTrue(AlwaysValid().validate("1"))
        XCTAssertTrue(AlwaysValid().validate("   "))
    }
    
}
