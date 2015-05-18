//
//  CPFTest.swift
//  Honour
//
//  Created by Jean Pimentel on 5/18/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class CPFTest: XCTestCase {

    func testValidFormattedCPF() {
        XCTAssertTrue(BR_CPF().validate("862.234.232-84"))
        XCTAssertTrue(BR_CPF().validate("862.234.232.84"))
        XCTAssertTrue(BR_CPF().validate("862-234-232-84"))
        XCTAssertTrue(BR_CPF().validate("8.6.2.2.3.4.2.3.2.8.4"))
    }

    func testValidUnformattedCPF() {
        XCTAssertTrue(BR_CPF().validate("86223423284"))
        XCTAssertTrue(BR_CPF().validate("95574461102"))
    }

    func testInvalidFormattedCPF() {
        XCTAssertFalse(BR_CPF().validate("000.000.000-00"))
        XCTAssertFalse(BR_CPF().validate("111.222.333-44"))
        XCTAssertFalse(BR_CPF().validate("999-999-999-99"))
        XCTAssertFalse(BR_CPF().validate("999999999.99"))
    }

    func testInvalidUnformattedCPF() {
        XCTAssertFalse(BR_CPF().validate("00000000000"))
        XCTAssertFalse(BR_CPF().validate("11122233344"))
        XCTAssertFalse(BR_CPF().validate("99999999999"))
        XCTAssertFalse(BR_CPF().validate("99999999999"))
    }

    func testInvalidEntries() {
        XCTAssertFalse(BR_CPF().validate(""))
        XCTAssertFalse(BR_CPF().validate("foo"))
        XCTAssertFalse(BR_CPF().validate("1"))
        XCTAssertFalse(BR_CPF().validate("12"))
        XCTAssertFalse(BR_CPF().validate("123"))
        XCTAssertFalse(BR_CPF().validate("999999999999"))
    }

    func testStrictValidEntries() {
        XCTAssertTrue(BR_CPF(strict: true).validate("86223423284"))
        XCTAssertTrue(BR_CPF(strict: true).validate("95574461102"))

        XCTAssertTrue(BR_CPF(true).validate("86223423284"))
        XCTAssertTrue(BR_CPF(true).validate("95574461102"))

        XCTAssertFalse(BR_CPF(strict: true).validate("862.234.232-84"))
        XCTAssertFalse(BR_CPF(strict: true).validate("955-744-611-02"))

        XCTAssertFalse(BR_CPF(true).validate("862.234.232-84"))
        XCTAssertFalse(BR_CPF(true).validate("955-744-611-02"))
    }

}
