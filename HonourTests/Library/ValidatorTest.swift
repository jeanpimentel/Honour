//
//  ValidatorTest.swift
//  Honour
//
//  Created by Jean Pimentel on 5/5/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class ValidatorTest: XCTestCase {

    func testEmptyRules() {
        let validator = Validator()
        XCTAssertTrue(validator.getRules().count == 0)
    }

    func testOneRule() {
        let validator = Validator()
        validator.addRule(Uppercase())
        XCTAssertTrue(validator.getRules().count == 1)
    }

    func testTwoRules() {
        let validator = Validator()
        validator.addRule(Uppercase())
        validator.addRule(StartsWith(startValue: "J"))
        XCTAssertTrue(validator.getRules().count == 2)
    }

    // MARK: - Assert
    func testAssertWithoutRules() {
        let validator = Validator()

        var result = validator.assert("")
        XCTAssertTrue(result.isValid)
        XCTAssertTrue(result.invalidRules.count == 0)

        result = validator.assert("J")
        XCTAssertTrue(result.isValid)
        XCTAssertTrue(result.invalidRules.count == 0)
    }

    func testAssertWithOneValidRule() {
        let validator = Validator()
        validator.addRule(Uppercase())

        let result = validator.assert("JEAN")
        XCTAssertTrue(result.isValid)
        XCTAssertTrue(result.invalidRules.count == 0)
    }

    func testAssertWithValidRules() {
        let validator = Validator()
        validator.addRule(Uppercase())
        validator.addRule(StartsWith(startValue: "J"))

        let result = validator.assert("JEAN")
        XCTAssertTrue(result.isValid)
        XCTAssertTrue(result.invalidRules.count == 0)
    }

    func testAssertWithOneInvalidRule() {
        let validator = Validator()
        validator.addRule(Uppercase())
        validator.addRule(StartsWith(startValue: "J"))

        let result = validator.assert("FOOBAR")
        XCTAssertFalse(result.isValid)
        XCTAssertTrue(result.invalidRules.count == 1)
        XCTAssertTrue(result.invalidRules[0] is StartsWith)
    }

    func testAssertWithInvalidRules() {
        let validator = Validator()
        validator.addRule(Lowercase())
        validator.addRule(StartsWith(startValue: "j"))

        let result = validator.assert("FOOBAR")
        XCTAssertFalse(result.isValid)
        XCTAssertTrue(result.invalidRules.count == 2)
        XCTAssertTrue(result.invalidRules[0] is Lowercase)
        XCTAssertTrue(result.invalidRules[1] is StartsWith)
    }

    // MARK: - Check
    func testCheckWithoutRules() {
        let validator = Validator()

        var result = validator.check("")
        XCTAssertTrue(result.isValid)
        XCTAssertTrue(result.invalidRule == nil)

        result = validator.check("J")
        XCTAssertTrue(result.isValid)
        XCTAssertTrue(result.invalidRule == nil)
    }

    func testCheckWithOneValidRule() {
        let validator = Validator()
        validator.addRule(Uppercase())

        let result = validator.check("JEAN")
        XCTAssertTrue(result.isValid)
        XCTAssertTrue(result.invalidRule == nil)
    }

    func testCheckWithValidRules() {
        let validator = Validator()
        validator.addRule(Uppercase())
        validator.addRule(StartsWith(startValue: "J"))

        let result = validator.check("JEAN")
        XCTAssertTrue(result.isValid)
        XCTAssertTrue(result.invalidRule == nil)
    }

    func testCheckWithOneInvalidRule() {
        let validator = Validator()
        validator.addRule(Uppercase())
        validator.addRule(StartsWith(startValue: "J"))

        let result = validator.check("FOOBAR")
        XCTAssertFalse(result.isValid)
        XCTAssertTrue(result.invalidRule != nil)
        XCTAssertTrue(result.invalidRule! is StartsWith)
    }

    func testCheckWithInvalidRule() {
        let validator = Validator()
        validator.addRule(Lowercase())
        validator.addRule(StartsWith(startValue: "j"))

        let result = validator.check("FOOBAR")
        XCTAssertFalse(result.isValid)
        XCTAssertTrue(result.invalidRule != nil)
        XCTAssertTrue(result.invalidRule! is Lowercase)
    }

    // MARK: - Validate
    func testValidateWithoutRules() {
        let validator = Validator()
        XCTAssertTrue(validator.validate(""))
        XCTAssertTrue(validator.validate("J"))
    }

    func testValidateWithOneValidRule() {
        let validator = Validator()
        validator.addRule(Uppercase())
        XCTAssertTrue(validator.validate("JEAN"))
    }

    func testValidateWithValidRules() {
        let validator = Validator()
        validator.addRule(Uppercase())
        validator.addRule(StartsWith(startValue: "J"))
        XCTAssertTrue(validator.validate("JEAN"))
    }

    func testValidateWithOneInvalidRule() {
        let validator = Validator()
        validator.addRule(Uppercase())
        validator.addRule(StartsWith(startValue: "J"))
        XCTAssertFalse(validator.validate("FOOBAR"))
    }

    func testValidateWithInvalidRules() {
        let validator = Validator()
        validator.addRule(Lowercase())
        validator.addRule(StartsWith(startValue: "j"))
        XCTAssertFalse(validator.validate("FOOBAR"))
    }



}

















