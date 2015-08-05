//
//  When.swift
//  Honour
//
//  Created by Jean Pimentel on 8/5/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class When : Rule {

    private var _when : Rule
    private var _then : Rule
    private var _else : Rule

    public init(_when: Rule, _then: Rule) {
        self._when = _when
        self._then = _then
        self._else = AlwaysInvalid()
    }

    public init(_ _when: Rule, _ _then: Rule) {
        self._when = _when
        self._then = _then
        self._else = AlwaysInvalid()
    }

    public init(_when: Rule, _then: Rule, _else: Rule) {
        self._when = _when
        self._then = _then
        self._else = _else
    }

    public init(_ _when: Rule, _ _then: Rule, _ _else: Rule) {
        self._when = _when
        self._then = _then
        self._else = _else
    }


    public override func validate(value: AnyObject) -> Bool {

        if self._when.validate(value) {
            return self._then.validate(value)
        }

        return self._else.validate(value)
    }

}