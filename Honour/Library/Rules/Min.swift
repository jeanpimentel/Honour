//
//  Min.swift
//  Honour
//
//  Created by Jean Pimentel on 7/27/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Min : Rule {

    private var min: NSNumber
    private var inclusive: Bool = true

    public init(min: NSNumber) {
        self.min = min;
    }

    public init(_ min: NSNumber) {
        self.min = min;
    }

    public init(min: NSNumber, inclusive: Bool) {
        self.min = min;
        self.inclusive = inclusive;
    }

    public init(_ min: NSNumber, inclusive: Bool) {
        self.min = min;
        self.inclusive = inclusive;
    }


    public override func validate(value: AnyObject) -> Bool {

        if let v = value as? NSNumber {

            let result = self.min.compare(v)

            // >=
            if self.inclusive {
                return result == NSComparisonResult.OrderedSame || result == NSComparisonResult.OrderedAscending
            }

            // >
            return result == NSComparisonResult.OrderedAscending
        }

        return false
    }

}