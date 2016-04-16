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

    public override func validate(value: AnyObject) -> Bool {

        if let v = value as? String {

            if self.startValue.characters.count == 0 {
                return true
            }

            return self.caseSensitive ? validateSensitive(v) : validateInsensitive(v)
        }

        return false
    }

    func validateSensitive(value: String) -> Bool {
        return value.hasPrefix(self.startValue)
    }

    func validateInsensitive(value: String) -> Bool {
        return value.lowercaseString.hasPrefix(self.startValue.lowercaseString) || value.uppercaseString.hasPrefix(self.startValue.uppercaseString)
    }

}