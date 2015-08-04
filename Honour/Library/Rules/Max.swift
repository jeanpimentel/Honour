//
//  Max.swift
//  Honour
//
//  Created by Jean Pimentel on 7/27/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Max : Rule {

    private var max: NSNumber
    private var inclusive: Bool = true

    public init(max: NSNumber) {
        self.max = max;
    }

    public init(_ max: NSNumber) {
        self.max = max;
    }

    public init(max: NSNumber, inclusive: Bool) {
        self.max = max;
        self.inclusive = inclusive;
    }

    public init(_ max: NSNumber, inclusive: Bool) {
        self.max = max;
        self.inclusive = inclusive;
    }


    public override func validate(value: AnyObject) -> Bool {

        if let v = value as? NSNumber {

            let result = self.max.compare(v)

            // <=
            if self.inclusive {
                return result == NSComparisonResult.OrderedSame || result == NSComparisonResult.OrderedDescending
            }

            // <
            return result == NSComparisonResult.OrderedDescending
        }

        return false
    }

}