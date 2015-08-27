//
//  Between.swift
//  Honour
//
//  Created by Jean Pimentel on 7/27/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Between : Rule {

    private var min : Min
    private var max : Max

    public init(min: AnyObject, max: AnyObject) {
        self.min = Min(min)
        self.max = Max(max)
    }

    public init(_ min: AnyObject, _ max: AnyObject) {
        self.min = Min(min)
        self.max = Max(max)
    }

    public init(min: AnyObject, max: AnyObject, inclusive: Bool) {
        self.min = Min(min, inclusive: inclusive)
        self.max = Max(max, inclusive: inclusive)
    }

    public init(_ min: AnyObject, _ max: AnyObject, inclusive: Bool) {
        self.min = Min(min, inclusive: inclusive)
        self.max = Max(max, inclusive: inclusive)
    }

    public override func validate(value: AnyObject) -> Bool {
        return self.min.validate(value) && self.max.validate(value)
    }

}