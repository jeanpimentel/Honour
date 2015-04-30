//
//  EndsWith.swift
//  Honour
//
//  Created by Jean Pimentel on 4/30/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class EndsWith : Rule {

    private var endValue: String
    private var caseSensitive: Bool = true

    public init(endValue: String) {
        self.endValue = endValue;
    }

    public init(endValue: String, caseSensitive: Bool) {
        self.endValue = endValue;
        self.caseSensitive = caseSensitive;
    }

    public func validate(value: String) -> Bool {

        if count(self.endValue) == 0 {
            return true
        }

        return self.caseSensitive ? validateSensitive(value) : validateInsensitive(value)
    }

    func validateSensitive(value: String) -> Bool {
        if let range = value.rangeOfString(self.endValue) {
            return range.endIndex == value.endIndex
        }
        return false
    }

    func validateInsensitive(value: String) -> Bool {
        if let range = value.lowercaseString.rangeOfString(self.endValue.lowercaseString) {
            return range.endIndex == value.endIndex
        }
        return false
    }

}