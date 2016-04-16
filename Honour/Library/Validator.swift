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
                self.add(rules: allOf.getRules())
            } else {
                self.add(rule: rule)
            }
        }
    }

    public override func add(rule rule: Rule) -> Validator {
        self.rules.append(rule)
        return self
    }
    
    // MARK: - Some Sugar
    public func mustBe(rule: Rule) -> Validator {
        return self.add(rule: rule)
    }

    public func mustHave(rule: Rule) -> Validator {
        return self.add(rule: rule)
    }

    public func and(rule: Rule) -> Validator {
        return self.add(rule: rule)
    }

    public func andMust(rule: Rule) -> Validator {
        return self.add(rule: rule)
    }

    public func andMustBe(rule: Rule) -> Validator {
        return self.add(rule: rule)
    }

    public func andMustHave(rule: Rule) -> Validator {
        return self.add(rule: rule)
    }

    class public func add(rule rule: Rule) -> Validator {
        return Validator().add(rule: rule)
    }

    class public func must(rule: Rule) -> Validator {
        return Validator().add(rule: rule)
    }

    class public func mustBe(rule: Rule) -> Validator {
        return Validator().add(rule: rule)
    }

    class public func mustHave(rule: Rule) -> Validator {
        return Validator().add(rule: rule)
    }


}