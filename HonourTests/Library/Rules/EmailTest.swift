//
//  EmailTest.swift
//  Honour
//
//  Created by Jean Pimentel on 5/19/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class EmailTest: XCTestCase {

    func testValidEmails() {
        XCTAssertTrue(Email().validate("test@test.com"))
        XCTAssertTrue(Email().validate("mail+mail@gmail.com"))
        XCTAssertTrue(Email().validate("mail.email@e.test.com"))
        XCTAssertTrue(Email().validate("a@a.a"))
        XCTAssertTrue(Email().validate("test@тест.рф"))
    }

    func testInvalidEmails() {
        XCTAssertFalse(Email().validate(""))
        XCTAssertFalse(Email().validate(" "))
        XCTAssertFalse(Email().validate("mailto:test@test.com "))
        XCTAssertFalse(Email().validate("test@test.com "))
        XCTAssertFalse(Email().validate(" test@test.com"))
        XCTAssertFalse(Email().validate(" test@test.com "))
        XCTAssertFalse(Email().validate("test@test"))
        XCTAssertFalse(Email().validate("test"))
        XCTAssertFalse(Email().validate("@test.com"))
        XCTAssertFalse(Email().validate("mail@test@test.com"))
        XCTAssertFalse(Email().validate("test.test@"))
        XCTAssertFalse(Email().validate("test.@test.com"))
        XCTAssertFalse(Email().validate("test@.test.com"))
        XCTAssertFalse(Email().validate("test@test..com"))
    }
}