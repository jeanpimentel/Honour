//
//  StartsWith.swift
//  Honour
//
//  Created by Jean Pimentel on 4/30/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class StartsWith : Rule {

    private var startValue: String
    private var caseSensitive: Bool = true

    public init(startValue: String) {
        self.startValue = startValue;
    }

    public init(_ startValue: String) {
        self.startValue = startValue;
    }

    public init(startValue: String, caseSensitive: Bool) {
        self.startValue = startValue;
        self.caseSensitive = caseSensitive;
    }

    public init(_ startValue: String, caseSensitive: Bool) {
        self.startValue = startValue;
        self.caseSensitive = caseSensitive;
    }

    public override func validate(value: String) -> Bool {

        if count(self.startValue) == 0 {
            return true
        }

        return self.caseSensitive ? validateSensitive(value) : validateInsensitive(value)
    }

    func validateSensitive(value: String) -> Bool {
        if let range = value.rangeOfString(self.startValue) {
            return range.startIndex == value.startIndex
        }
        return false
    }

    func validateInsensitive(value: String) -> Bool {
        if let range = value.lowercaseString.rangeOfString(self.startValue.lowercaseString) {
            return range.startIndex == value.startIndex
        }
        return false
    }

}