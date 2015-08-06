//
//  Validator.swift
//  Honour
//
//  Created by Jean Pimentel on 5/5/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Validator : AllOf {

    public override init(_ rules: Rule...) {
        super.init()
        for rule in rules {
            if let allOf = rule as? AllOf {
                self.addRules(allOf.getRules())
            } else {
                self.addRule(rule)
            }
        }
    }

    public override func addRule(rule: Rule) -> Validator {
        self.rules.append(rule)
        return self
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