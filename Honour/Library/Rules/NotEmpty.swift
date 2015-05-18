//
//  NotEmpty.swift
//  Honour
//
//  Created by Jean Pimentel on 5/18/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class NotEmpty : Rule {

    public override func validate(value: String) -> Bool {

        let invalidSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        var trimmed = value.stringByTrimmingCharactersInSet(invalidSet)

        return count(trimmed) != 0
    }
}