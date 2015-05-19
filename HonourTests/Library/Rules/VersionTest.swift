//
//  VersionTest.swift
//  Honour
//
//  Created by Jean Pimentel on 5/19/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class VersionTest: XCTestCase {

    func testValidVersions() {
        XCTAssertTrue(Version().validate("1.0.0"))
        XCTAssertTrue(Version().validate("1.0.0-alpha"))
        XCTAssertTrue(Version().validate("1.0.0-alpha.1"))
        XCTAssertTrue(Version().validate("1.0.0-0.3.7"))
        XCTAssertTrue(Version().validate("1.0.0-x.7.z.92"))
        XCTAssertTrue(Version().validate("1.3.7+build.2.b8f12d7"))
        XCTAssertTrue(Version().validate("1.3.7-rc.1"))
    }

    func testInvalidVersions() {
        XCTAssertFalse(Version().validate(""))
        XCTAssertFalse(Version().validate("1.3.7--"))
        XCTAssertFalse(Version().validate("1.3.7++"))
        XCTAssertFalse(Version().validate("foo"))
        XCTAssertFalse(Version().validate("1.2.3.4"))
        XCTAssertFalse(Version().validate("1.2.3.4-beta"))
        XCTAssertFalse(Version().validate("beta"))
    }
    
}
