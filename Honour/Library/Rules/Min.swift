//
//  Min.swift
//  Honour
//
//  Created by Jean Pimentel on 7/27/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Min : Rule {

    private var min: AnyObject
    private var inclusive: Bool = true

    public init(min: AnyObject) {
        self.min = min;
    }

    public init(_ min: AnyObject) {
        self.min = min;
    }

    public init(min: AnyObject, inclusive: Bool) {
        self.min = min;
        self.inclusive = inclusive;
    }

    public init(_ min: AnyObject, inclusive: Bool) {
        self.min = min;
        self.inclusive = inclusive;
    }


    public override func validate(value: AnyObject) -> Bool {

        if let min = self.min as? NSNumber {
            if let v = value as? NSNumber {

                let result = self.min.compare(v)

                // >=
                if self.inclusive {
                    return result == NSComparisonResult.OrderedSame || result == NSComparisonResult.OrderedAscending
                }

                // >
                return result == NSComparisonResult.OrderedAscending
            }
        }
        
        if let min = self.min as? NSDate {
            if let v = value as? NSDate {
                
                let result = self.min.compare(v)
                
                // >=
                if self.inclusive {
                    return result == NSComparisonResult.OrderedSame || result == NSComparisonResult.OrderedAscending
                }
                
                // >
                return result == NSComparisonResult.OrderedAscending
            }
        }
        

        return false
    }

}