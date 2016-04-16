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
        validator.add(rule: Uppercase())
        XCTAssertTrue(validator.getRules().count == 1)
    }
    
    func testTwoRules() {
        let validator = Validator()
        validator.add(rule: Uppercase())
        validator.add(rule: StartsWith("J"))
        XCTAssertTrue(validator.getRules().count == 2)
    }
    
    func testChainRules() {
        let validator = Validator()
        validator.add(rule: Uppercase()).add(rule: StartsWith(startValue: "J"))
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
        validator.add(rule: Uppercase())
        
        let result = validator.assert("JEAN")
        XCTAssertTrue(result.isValid)
        XCTAssertTrue(result.invalidRules.count == 0)
    }
    
    func testAssertWithValidRules() {
        let validator = Validator()
        validator.add(rule: Uppercase())
        validator.add(rule: StartsWith("J"))
        
        let result = validator.assert("JEAN")
        XCTAssertTrue(result.isValid)
        XCTAssertTrue(result.invalidRules.count == 0)
    }
    
    func testAssertWithOneInvalidRule() {
        let validator = Validator()
        validator.add(rule: Uppercase())
        validator.add(rule: StartsWith("J"))
        
        let result = validator.assert("FOOBAR")
        XCTAssertFalse(result.isValid)
        XCTAssertTrue(result.invalidRules.count == 1)
        XCTAssertTrue(result.invalidRules[0] is StartsWith)
    }
    
    func testAssertWithInvalidRules() {
        let validator = Validator()
        validator.add(rule: Lowercase())
        validator.add(rule: StartsWith("j"))
        
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
        validator.add(rule: Uppercase())
        
        let result = validator.check("JEAN")
        XCTAssertTrue(result.isValid)
        XCTAssertTrue(result.invalidRule == nil)
    }
    
    func testCheckWithValidRules() {
        let validator = Validator()
        validator.add(rule: Uppercase())
        validator.add(rule: StartsWith("J"))
        
        let result = validator.check("JEAN")
        XCTAssertTrue(result.isValid)
        XCTAssertTrue(result.invalidRule == nil)
    }
    
    func testCheckWithOneInvalidRule() {
        let validator = Validator()
        validator.add(rule: Uppercase())
        validator.add(rule: StartsWith("J"))
        
        let result = validator.check("FOOBAR")
        XCTAssertFalse(result.isValid)
        XCTAssertTrue(result.invalidRule != nil)
        XCTAssertTrue(result.invalidRule! is StartsWith)
    }
    
    func testCheckWithInvalidRule() {
        let validator = Validator()
        validator.add(rule: Lowercase())
        validator.add(rule: StartsWith("j"))
        
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
        validator.add(rule: Uppercase())
        XCTAssertTrue(validator.validate("JEAN"))
    }
    
    func testValidateWithValidRules() {
        let validator = Validator()
        validator.add(rule: Uppercase())
        validator.add(rule: StartsWith("J"))
        XCTAssertTrue(validator.validate("JEAN"))
    }
    
    func testValidateWithOneInvalidRule() {
        let validator = Validator()
        validator.add(rule: Uppercase())
        validator.add(rule: StartsWith("J"))
        XCTAssertFalse(validator.validate("FOOBAR"))
    }
    
    func testValidateWithInvalidRules() {
        let validator = Validator()
        validator.add(rule: Lowercase())
        validator.add(rule: StartsWith("j"))
        XCTAssertFalse(validator.validate("FOOBAR"))
    }
    
    // MARK: - Sugar
    func testInstanceMethod() {
        var validator = Validator.add(rule: Uppercase())
        validator.add(rule: StartsWith("J"))
        XCTAssertTrue(validator.validate("JEAN"))
        
        validator = Validator.add(rule: Uppercase()).add(rule: StartsWith("J"))
        XCTAssertTrue(validator.validate("JEAN"))
        
        XCTAssertTrue(Validator.add(rule: Uppercase()).add(rule: StartsWith("J")).validate("JEAN"))
    }
    
    func testSyntaxSugarMethods() {
        XCTAssertTrue(Validator.add(rule: Uppercase()).add(rule: StartsWith("J")).validate("JEAN"))
        XCTAssertTrue(Validator().add(rule: Uppercase()).add(rule: StartsWith("J")).validate("JEAN"))
        XCTAssertTrue(Validator.mustBe(Uppercase()).andMust(StartsWith("J")).validate("JEAN"))
        XCTAssertTrue(Validator.must(StartsWith("J")).and(EndsWith("N")).validate("JEAN"))
        XCTAssertTrue(Validator.must(StartsWith("J")).and(EndsWith("N")).andMustHave(Length(min: 3, max: 60)).validate("JEAN"))
    }
}
