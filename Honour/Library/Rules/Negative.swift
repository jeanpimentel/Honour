//
//  Negative.swift
//  Honour
//
//  Created by Jean Pimentel on 8/4/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Negative : Rule {

    public override func validate(value: AnyObject) -> Bool {

        if let v = value as? NSNumber {
            return Max(0, inclusive: false).validate(v)
        }

        return false
    }

}