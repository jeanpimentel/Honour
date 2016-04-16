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

    public override func validate(value: AnyObject) -> Bool {

        if let v = value as? String {

            let range = NSMakeRange(0, v.characters.count)

            if let r = try? NSRegularExpression(pattern: self.regex, options: ((self.caseInsensitive) ? .CaseInsensitive : [])) {
                return r.rangeOfFirstMatchInString(v, options: [], range: range).location != NSNotFound
            }
            
            return false
        }

        return false
    }

}