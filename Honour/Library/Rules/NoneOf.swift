//
//  NoneOf.swift
//  Honour
//
//  Created by Jean Pimentel on 8/5/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class NoneOf : Composite {

    public init(_ rules: Rule...) {
        super.init()
        for rule in rules {
            if let noneOf = rule as? NoneOf {
                self.addRules(noneOf.getRules())
            } else {
                self.addRule(rule)
            }
        }
    }

    public override init() {
        super.init()
    }

    public override func addRule(rule: Rule) -> NoneOf {
        self.rules.append(rule)
        return self
    }

    public func assert(value: AnyObject) -> (isValid: Bool, invalidRules: Array<Rule>) {

        var invalidRules: Array<Rule> = []

        for rule in self.rules {
            if rule.validate(value) {
                invalidRules.append(rule)
            }
        }

        return (invalidRules.count == 0, invalidRules)
    }

    public func check(value: AnyObject) -> (isValid: Bool, invalidRule: Rule?) {

        for rule in self.rules {
            if rule.validate(value) {
                return (false, rule)
            }
        }

        return (true, nil)
    }

    public override func validate(value: AnyObject) -> Bool {

        for rule in self.rules {
            if rule.validate(value) {
                return false
            }
        }
        
        return true
    }

}