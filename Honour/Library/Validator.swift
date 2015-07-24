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


    public func assert(value: AnyObject) -> (isValid: Bool, invalidRules: Array<Rule>) {
        
        var rules: Array<Rule> = []

        for rule in self.rules {
            if !rule.validate(value) {
                rules.append(rule)
            }
        }

        return (rules.count == 0, rules)
    }

    public func check(value: AnyObject) -> (isValid: Bool, invalidRule: Rule?) {

        for rule in self.rules {
            if !rule.validate(value) {
                return (false, rule)
            }
        }

        return (true, nil)
    }

    public func validate(value: AnyObject) -> Bool {

        for rule in self.rules {
            if !rule.validate(value) {
                return false
            }
        }

        return true
    }

    // MARK: - Some Sugar
    public func mustBe(rule: Rule) -> Validator {
        return self.addRule(rule)
    }

    public func mustHave(rule: Rule) -> Validator {
        return self.addRule(rule)
    }

    public func and(rule: Rule) -> Validator {
        return self.addRule(rule)
    }

    public func andMust(rule: Rule) -> Validator {
        return self.addRule(rule)
    }

    public func andMustBe(rule: Rule) -> Validator {
        return self.addRule(rule)
    }

    public func andMustHave(rule: Rule) -> Validator {
        return self.addRule(rule)
    }

    class public func addRule(rule: Rule) -> Validator {
        return Validator().addRule(rule)
    }

    class public func must(rule: Rule) -> Validator {
        return Validator().addRule(rule)
    }

    class public func mustBe(rule: Rule) -> Validator {
        return Validator().addRule(rule)
    }

    class public func mustHave(rule: Rule) -> Validator {
        return Validator().addRule(rule)
    }


}