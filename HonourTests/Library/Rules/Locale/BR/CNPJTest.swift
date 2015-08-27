//
//  CNPJTest.swift
//  Honour
//
//  Created by Jean Fellipe de Almeida Pimentel on 8/26/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import XCTest
import Honour

class CNPJTest: XCTestCase {
    
    func testValidFormattedCNPJ() {
        XCTAssertTrue(BR_CNPJ().validate("32.063.364/0001-07"))
        XCTAssertTrue(BR_CNPJ().validate("32.063.364/0001.07"))
        XCTAssertTrue(BR_CNPJ().validate("32-063-364/0001-07"))
        XCTAssertTrue(BR_CNPJ().validate("32-063-364-0001-07"))
        XCTAssertTrue(BR_CNPJ().validate("3.2.0.6.3.3.6.4.0.0.0.1.0.7"))
    }
    
    func testValidUnformattedCNPJ() {
        XCTAssertTrue(BR_CNPJ().validate("32063364000107"))
        XCTAssertTrue(BR_CNPJ().validate("24760428000109"))
    }
    
    func testInvalidFormattedCNPJ() {
        XCTAssertFalse(BR_CNPJ().validate("12.345.678/9012-34"))
        XCTAssertFalse(BR_CNPJ().validate("12345678/901234"))
        XCTAssertFalse(BR_CNPJ().validate("11.111.111/1111-11"))
    }
    
    func testInvalidUnformattedCNPJ() {
        XCTAssertFalse(BR_CNPJ().validate("00000000000"))
        XCTAssertFalse(BR_CNPJ().validate("11111111111"))
        XCTAssertFalse(BR_CNPJ().validate("12345678900"))
        XCTAssertFalse(BR_CNPJ().validate("99299929384"))
        XCTAssertFalse(BR_CNPJ().validate("84434895894"))
    }
    
    func testInvalidEntries() {
        XCTAssertFalse(BR_CNPJ().validate(""))
        XCTAssertFalse(BR_CNPJ().validate("foo"))
        XCTAssertFalse(BR_CNPJ().validate("1"))
        XCTAssertFalse(BR_CNPJ().validate("12"))
        XCTAssertFalse(BR_CNPJ().validate("123"))
        XCTAssertFalse(BR_CNPJ().validate("999999999999"))
    }
    
    func testStrictValidEntries() {
        XCTAssertTrue(BR_CNPJ(strict: true).validate("32063364000107"))
        XCTAssertTrue(BR_CNPJ(strict: true).validate("24760428000109"))
        
        XCTAssertTrue(BR_CNPJ(true).validate("32063364000107"))
        XCTAssertTrue(BR_CNPJ(true).validate("24760428000109"))
        
        XCTAssertFalse(BR_CNPJ(strict: true).validate("32.063.364/0001-07"))
        XCTAssertFalse(BR_CNPJ(strict: true).validate("24.760.428/0001-09"))
        
        XCTAssertFalse(BR_CNPJ(true).validate("32.063.364/0001-07"))
        XCTAssertFalse(BR_CNPJ(true).validate("24.760.428/0001-09"))
    }
    
}
