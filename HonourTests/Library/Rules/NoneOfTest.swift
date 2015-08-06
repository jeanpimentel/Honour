//
//  NoneOfTest.swift
//  Honour
//
//  Created by Jean Pimentel on 8/5/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class NoneOfTest: XCTestCase {

    func testValidNoneOf() {
        XCTAssertTrue(NoneOf().validate("pimentel"))
        XCTAssertTrue(NoneOf(StartsWith("J")).validate("pimentel"))
        XCTAssertTrue(NoneOf(StartsWith("J"), EndsWith("N")).validate("pimentel"))
        XCTAssertTrue(NoneOf(StartsWith("J"), EndsWith("N"), Length(min: 10, max: 60)).validate("pimentel"))
        XCTAssertTrue(NoneOf(StartsWith("J"), NoneOf(EndsWith("N"), Length(min: 10, max: 60))).validate("pimentel"))
    }

    func testInvalidNoneOf() {
        XCTAssertFalse(NoneOf(StartsWith("J")).validate("JEAN"))
        XCTAssertFalse(NoneOf(StartsWith("J")).validate("JEAN"))
        XCTAssertFalse(NoneOf(StartsWith("J"), EndsWith("N")).validate("JEAN"))
        XCTAssertFalse(NoneOf(StartsWith("J"), EndsWith("N"), Length(min: 3, max: 60)).validate("JEAN"))
        XCTAssertFalse(NoneOf(StartsWith("J"), NoneOf(EndsWith("N"), Length(min: 3, max: 60))).validate("JEAN"))
    }

    func testAssertWithInvalidRules() {
        let validator = NoneOf(Lowercase(), StartsWith("j"))
        let result = validator.assert("jean")
        XCTAssertFalse(result.isValid)
        XCTAssertTrue(result.invalidRules.count == 2)
        XCTAssertTrue(result.invalidRules[0] is Lowercase)
        XCTAssertTrue(result.invalidRules[1] is StartsWith)

        let validator2 = NoneOf(StartsWith("P"), NoneOf(EndsWith("L"), Length(min: 6, max: 60)))
        let result2 = validator2.assert("PIMENTEL")
        XCTAssertFalse(result2.isValid)
        XCTAssertTrue(result2.invalidRules.count == 3)
        XCTAssertTrue(result2.invalidRules[0] is StartsWith)
        XCTAssertTrue(result2.invalidRules[1] is EndsWith)
        XCTAssertTrue(result2.invalidRules[2] is Length)
    }

    func testCheckWithInvalidRule() {
        let validator = NoneOf(Lowercase(), StartsWith("j"))
        let result = validator.check("jean")
        XCTAssertFalse(result.isValid)
        XCTAssertTrue(result.invalidRule != nil)
        XCTAssertTrue(result.invalidRule! is Lowercase)

        let validator2 = NoneOf(StartsWith("P"), NoneOf(EndsWith("L"), Length(min: 6, max: 60)))
        let result2 = validator2.check("PIMENTEL")
        XCTAssertFalse(result2.isValid)
        XCTAssertTrue(result2.invalidRule != nil)
        XCTAssertTrue(result2.invalidRule! is StartsWith)
    }
}
