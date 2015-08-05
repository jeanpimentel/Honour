//
//  Length.swift
//  Honour
//
//  Created by Jean Pimentel on 4/30/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Length : Rule {

    private var min: Int?
    private var max: Int?

    public init(min: Int) {
        self.min = min
    }

    public init(max: Int) {
        self.max = max
    }

    public init(equal: Int) {
        self.min = equal
        self.max = equal
    }

    public init(min: Int, max: Int) {
        self.min = min
        self.max = max
    }

    public override func validate(value: AnyObject) -> Bool {

        if let v = value as? String {
            return self.validateMin(v) && self.validateMax(v)
        }

        return false
    }

    func validateMin(value: String) -> Bool {
        if self.min == nil {
            return true
        }
        return count(value) >= self.min
    }

    func validateMax(value: String) -> Bool {
        if self.max == nil {
            return true
        }
        return count(value) <= self.max
    }
}