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

    public init(_ endValue: String) {
        self.endValue = endValue;
    }

    public init(endValue: String, caseSensitive: Bool) {
        self.endValue = endValue;
        self.caseSensitive = caseSensitive;
    }

    public init(_ endValue: String, caseSensitive: Bool) {
        self.endValue = endValue;
        self.caseSensitive = caseSensitive;
    }

    public override func validate(value: String) -> Bool {

        if count(self.endValue) == 0 {
            return true
        }

        return self.caseSensitive ? validateSensitive(value) : validateInsensitive(value)
    }

    func validateSensitive(value: String) -> Bool {
        return value.hasSuffix(self.endValue)
    }

    func validateInsensitive(value: String) -> Bool {
        return value.lowercaseString.hasSuffix(self.endValue.lowercaseString) || value.uppercaseString.hasSuffix(self.endValue.uppercaseString)
    }

}