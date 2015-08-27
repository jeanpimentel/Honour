//
//  Max.swift
//  Honour
//
//  Created by Jean Pimentel on 7/27/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Max : Rule {

    private var max: AnyObject
    private var inclusive: Bool = true

    public init(max: AnyObject) {
        self.max = max;
    }

    public init(_ max: AnyObject) {
        self.max = max;
    }

    public init(max: AnyObject, inclusive: Bool) {
        self.max = max;
        self.inclusive = inclusive;
    }

    public init(_ max: AnyObject, inclusive: Bool) {
        self.max = max;
        self.inclusive = inclusive;
    }


    public override func validate(value: AnyObject) -> Bool {

        if let max = self.max as? NSNumber {
            if let v = value as? NSNumber {

                let result = self.max.compare(v)

                // <=
                if self.inclusive {
                    return result == NSComparisonResult.OrderedSame || result == NSComparisonResult.OrderedDescending
                }

                // <
                return result == NSComparisonResult.OrderedDescending
            }
        }
        
        if let max = self.max as? NSDate {
            if let v = value as? NSDate {
                
                let result = self.max.compare(v)
                
                // <=
                if self.inclusive {
                    return result == NSComparisonResult.OrderedSame || result == NSComparisonResult.OrderedDescending
                }
                
                // <
                return result == NSComparisonResult.OrderedDescending
            }
        }


        return false
    }

}