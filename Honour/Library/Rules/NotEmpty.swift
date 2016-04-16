//
//  NotEmpty.swift
//  Honour
//
//  Created by Jean Pimentel on 5/18/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class NotEmpty : Rule {

    public override func validate(value: AnyObject) -> Bool {

        if let v = value as? String {

            let invalidSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
            let trimmed = v.stringByTrimmingCharactersInSet(invalidSet)

            return trimmed.characters.count != 0
        }

        return false
    }
}