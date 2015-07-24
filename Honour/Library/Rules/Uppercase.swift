//
//  Uppercase.swift
//  Honour
//
//  Created by Jean Pimentel on 4/30/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Uppercase : Rule {

    public override func validate(value: AnyObject) -> Bool {

        if let v = value as? String {
            return v.uppercaseString == v
        }

        return false
    }
}