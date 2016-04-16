//
//  RuleTest.swift
//  Honour
//
//  Created by Jean Pimentel on 5/6/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class RuleTest: XCTestCase {

    func testHashable() {
        XCTAssertFalse(Uppercase() == Uppercase())
    }

    func testEquatable() {
        let u1 = Uppercase()
        let u2 = u1
        XCTAssertTrue(u1 == u2)

        let u3 = Uppercase()
        let u4 = u3
        XCTAssertTrue(u3 == u4)
    }

}
