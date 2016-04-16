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


    public override func validate(value: AnyObject) -> Bool {

        if let v = value as? String {

            if self.endValue.characters.count == 0 {
                return true
            }

            return self.caseSensitive ? validateSensitive(v) : validateInsensitive(v)
        }

        return false
    }

    func validateSensitive(value: String) -> Bool {
        return value.hasSuffix(self.endValue)
    }

    func validateInsensitive(value: String) -> Bool {
        return value.lowercaseString.hasSuffix(self.endValue.lowercaseString) || value.uppercaseString.hasSuffix(self.endValue.uppercaseString)
    }

}