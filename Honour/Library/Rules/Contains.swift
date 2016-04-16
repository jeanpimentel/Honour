//
//  StartsWith.swift
//  Honour
//
//  Created by Jean Pimentel on 4/30/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Contains : Rule {

    private var value: String
    private var caseSensitive: Bool = true

    public init(value: String) {
        self.value = value;
    }

    public init(_ value: String) {
        self.value = value;
    }

    public init(value: String, caseSensitive: Bool) {
        self.value = value;
        self.caseSensitive = caseSensitive;
    }

    public init(_ value: String, caseSensitive: Bool) {
        self.value = value;
        self.caseSensitive = caseSensitive;
    }

    public override func validate(value: AnyObject) -> Bool {

        if let v = value as? String {

            if self.value.characters.count == 0 {
                return true
            }

            return self.caseSensitive ? validateSensitive(v) : validateInsensitive(v)
        }

        return false
    }

    func validateSensitive(value: String) -> Bool {
        return value.rangeOfString(self.value) != nil
    }

    func validateInsensitive(value: String) -> Bool {
        return value.lowercaseString.rangeOfString(self.value.lowercaseString) != nil
    }
    
}