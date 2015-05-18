//
//  Regex.swift
//  Honour
//
//  Created by Jean Pimentel on 5/18/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Regex: Rule {

    private var regex: String
    private var caseInsensitive: Bool = false

    public init(regex: String) {
        self.regex = regex;
    }

    public init(_ regex: String) {
        self.regex = regex;
    }

    public init(regex: String, caseInsensitive: Bool) {
        self.regex = regex;
        self.caseInsensitive = caseInsensitive;
    }

    public init(_ regex: String, caseInsensitive: Bool) {
        self.regex = regex;
        self.caseInsensitive = caseInsensitive;
    }

    public override func validate(value: String) -> Bool {

        let range = NSMakeRange(0, count(value))

        if let r = NSRegularExpression(pattern: self.regex, options: ((self.caseInsensitive) ? .CaseInsensitive : .allZeros), error: nil) {
            return r.rangeOfFirstMatchInString(value, options: .allZeros, range: range).location != NSNotFound
        }

        return false
    }

}