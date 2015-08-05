//
//  Odd.swift
//  Honour
//
//  Created by Jean Pimentel on 8/5/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Odd : Rule {

    public override func validate(value: AnyObject) -> Bool {

        if let v = value as? NSNumber {

            if v.stringValue.rangeOfString(".") != nil {
                return false
            }

            return v.longLongValue % 2 != 0
        }

        return false
    }

}