//
//  Composite.swift
//  Honour
//
//  Created by Jean Pimentel on 8/5/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Composite : Rule {

    internal var rules: Array<Rule>

    internal override init() {
        self.rules = []
    }

    public func addRule(rule: Rule) -> Composite {
        self.rules.append(rule)
        return self
    }

    public func addRules(rules: Array<Rule>) -> Composite {
        for rule in rules {
            self.rules.append(rule)
        }
        return self
    }

    public func getRules() -> Array<Rule> {
        return self.rules
    }

    public func removeRules() {
        self.rules = []
    }

}