//
//  Validator.swift
//  Honour
//
//  Created by Jean Pimentel on 5/5/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Validator {

    private var rules: Array<Rule>

    public init() {
        self.rules = []
    }

    public func addRule(rule: Rule) -> Validator {
        self.rules.append(rule)
        return self
    }

    public func getRules() -> Array<Rule> {
        return self.rules
    }


    public func assert(value: String) -> (isValid: Bool, invalidRules: Array<Rule>) {
        
        var rules: Array<Rule> = []

        for rule in self.rules {
            if !rule.validate(value) {
                rules.append(rule)
            }
        }

        return (rules.count == 0, rules)
    }

    public func check(value: String) -> (isValid: Bool, invalidRule: Rule?) {

        for rule in self.rules {
            if !rule.validate(value) {
                return (false, rule)
            }
        }

        return (true, nil)
    }

    public func validate(value: String) -> Bool {

        for rule in self.rules {
            if !rule.validate(value) {
                return false
            }
        }

        return true
    }
}