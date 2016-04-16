//
//  NoWhitespace.swift
//  Honour
//
//  Created by Jean Pimentel on 5/18/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class NoWhitespace : Rule {

    public override func validate(value: AnyObject) -> Bool {

        if let v = value as? String {

            if v.characters.count == 0 {
                return true
            }

            let invalidSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
            if v.rangeOfCharacterFromSet(invalidSet) != nil {
                return false
            }
            
            return true

        }

        return false
    }
}