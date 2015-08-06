//
//  OneOfTest.swift
//  Honour
//
//  Created by Jean Pimentel on 8/5/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class OneOfTest: XCTestCase {

    func testValidOneOf() {
        XCTAssertTrue(OneOf(StartsWith("J")).validate("JEAN"))
        XCTAssertTrue(OneOf(StartsWith("J"), EndsWith("L")).validate("JEAN"))
        XCTAssertTrue(OneOf(StartsWith("J"), EndsWith("L"), Length(min: 1, max: 3)).validate("JEAN"))
        XCTAssertTrue(OneOf(StartsWith("J"), OneOf(EndsWith("L"), Length(min: 1, max: 3))).validate("JEAN"))
    }

    func testInvalidOneOf() {
        XCTAssertFalse(OneOf().validate("JEAN"))
        XCTAssertFalse(OneOf(StartsWith("P")).validate("JEAN"))
        XCTAssertFalse(OneOf(StartsWith("P"), EndsWith("L")).validate("JEAN"))
        XCTAssertFalse(OneOf(StartsWith("P"), EndsWith("L"), Length(min: 10, max: 60)).validate("JEAN"))
        XCTAssertFalse(OneOf(StartsWith("P"), OneOf(EndsWith("L"), Length(min: 10, max: 60))).validate("JEAN"))
    }

    func testAssertWithInvalidRules() {
        let validator = OneOf(Lowercase(), StartsWith("j"))
        let result = validator.assert("FOOBAR")
        XCTAssertFalse(result.isValid)
        XCTAssertTrue(result.invalidRules.count == 2)
        XCTAssertTrue(result.invalidRules[0] is Lowercase)
        XCTAssertTrue(result.invalidRules[1] is StartsWith)

        let validator2 = OneOf(StartsWith("P"), OneOf(EndsWith("M"), Length(min: 6, max: 60)))
        let result2 = validator2.assert("JEAN")
        XCTAssertFalse(result2.isValid)
        XCTAssertTrue(result2.invalidRules.count == 3)
        XCTAssertTrue(result2.invalidRules[0] is StartsWith)
        XCTAssertTrue(result2.invalidRules[1] is EndsWith)
        XCTAssertTrue(result2.invalidRules[2] is Length)
    }

    func testCheckWithInvalidRule() {
        let validator = OneOf(Lowercase(), StartsWith("j"))
        let result = validator.check("FOOBAR")
        XCTAssertFalse(result.isValid)
        XCTAssertTrue(result.invalidRule != nil)
        XCTAssertTrue(result.invalidRule! is Lowercase)

        let validator2 = OneOf(StartsWith("P"), OneOf(EndsWith("M"), Length(min: 6, max: 60)))
        let result2 = validator2.check("JEAN")
        XCTAssertFalse(result2.isValid)
        XCTAssertTrue(result2.invalidRule != nil)
        XCTAssertTrue(result2.invalidRule! is StartsWith)
    }

}
