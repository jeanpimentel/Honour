//
//  OneOf.swift
//  Honour
//
//  Created by Jean Pimentel on 8/5/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class OneOf : Composite {

    public init(_ rules: Rule...) {
        super.init()
        for rule in rules {
            if let oneOf = rule as? OneOf {
                self.addRules(oneOf.getRules())
            } else {
                self.addRule(rule)
            }
        }
    }

    public override init() {
        super.init()
    }

    public override func addRule(rule: Rule) -> OneOf {
        self.rules.append(rule)
        return self
    }

    public func assert(value: AnyObject) -> (isValid: Bool, invalidRules: Array<Rule>) {

        var invalidRules: Array<Rule> = []

        for rule in self.rules {
            if !rule.validate(value) {
                invalidRules.append(rule)
            }
        }

        return (invalidRules.count != rules.count, invalidRules)
    }

    public func check(value: AnyObject) -> (isValid: Bool, invalidRule: Rule?) {

        var invalidRules: Array<Rule> = []

        for rule in self.rules {
            if rule.validate(value) {
                return (true, nil)
            } else {
                invalidRules.append(rule)
            }
        }

        return (false, invalidRules.first)
    }

    public override func validate(value: AnyObject) -> Bool {

        for rule in self.rules {
            if rule.validate(value) {
                return true
            }
        }
        
        return false
    }

}