//
//  Email.swift
//  Honour
//
//  Created by Jean Pimentel on 5/19/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Email : Rule {

    public override func validate(value: AnyObject) -> Bool {

        if let v = value as? String {

            if count(v) == 0 {
                return false
            }

            var range = NSMakeRange(0, count(v))

            var error: NSError?
            var detector: NSDataDetector = NSDataDetector(types: NSTextCheckingType.Link.rawValue, error: &error)!
            if error != nil {
                return false
            }

            if let result = detector.firstMatchInString(v, options: NSMatchingOptions.Anchored, range: range) {

                if result.URL!.scheme != "mailto" {
                    return false
                }

                if !NSEqualRanges(result.range, range) {
                    return false
                }

                if value.hasPrefix("mailto") {
                    return false
                }
                
                return true
            }
            
            return false
        }

        return false
    }
    
}