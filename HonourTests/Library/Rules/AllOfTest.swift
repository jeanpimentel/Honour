//
//  AllOfTest.swift
//  Honour
//
//  Created by Jean Pimentel on 8/5/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class AllOfTest: XCTestCase {

    func testValidAllOf() {
        XCTAssertTrue(AllOf().validate("JEAN"))
        XCTAssertTrue(AllOf(StartsWith("J")).validate("JEAN"))
        XCTAssertTrue(AllOf(StartsWith("J"), EndsWith("N")).validate("JEAN"))
        XCTAssertTrue(AllOf(StartsWith("J"), EndsWith("N"), Length(min: 3, max: 60)).validate("JEAN"))
        XCTAssertTrue(AllOf(StartsWith("J"), AllOf(EndsWith("N"), Length(min: 3, max: 60))).validate("JEAN"))
    }

    func testInvalidAllOf() {
        XCTAssertFalse(AllOf(StartsWith("P")).validate("JEAN"))
        XCTAssertFalse(AllOf(StartsWith("P"), EndsWith("N")).validate("JEAN"))
        XCTAssertFalse(AllOf(StartsWith("P"), EndsWith("N"), Length(min: 3, max: 60)).validate("JEAN"))
        XCTAssertFalse(AllOf(StartsWith("P"), AllOf(EndsWith("N"), Length(min: 6, max: 60))).validate("JEAN"))
    }

    func testAssertWithInvalidRules() {
        let validator = AllOf(Lowercase(), StartsWith("j"))
        let result = validator.assert("FOOBAR")
        XCTAssertFalse(result.isValid)
        XCTAssertTrue(result.invalidRules.count == 2)
        XCTAssertTrue(result.invalidRules[0] is Lowercase)
        XCTAssertTrue(result.invalidRules[1] is StartsWith)

        let validator2 = AllOf(StartsWith("P"), AllOf(EndsWith("M"), Length(min: 6, max: 60)))
        let result2 = validator2.assert("JEAN")
        XCTAssertFalse(result2.isValid)
        XCTAssertTrue(result2.invalidRules.count == 3)
        XCTAssertTrue(result2.invalidRules[0] is StartsWith)
        XCTAssertTrue(result2.invalidRules[1] is EndsWith)
        XCTAssertTrue(result2.invalidRules[2] is Length)
    }

    func testCheckWithInvalidRule() {
        let validator = AllOf(Lowercase(), StartsWith("j"))
        let result = validator.check("FOOBAR")
        XCTAssertFalse(result.isValid)
        XCTAssertTrue(result.invalidRule != nil)
        XCTAssertTrue(result.invalidRule! is Lowercase)

        let validator2 = AllOf(StartsWith("J"), AllOf(EndsWith("M"), Length(min: 6, max: 60)))
        let result2 = validator2.check("JEAN")
        XCTAssertFalse(result2.isValid)
        XCTAssertTrue(result2.invalidRule != nil)
        XCTAssertTrue(result2.invalidRule! is EndsWith)
    }

}
