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

            if v.characters.count == 0 {
                return false
            }

            let range = NSMakeRange(0, v.characters.count)

            guard let detector: NSDataDetector = try? NSDataDetector(types: NSTextCheckingType.Link.rawValue) else {
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