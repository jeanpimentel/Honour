//
//  Rule.swift
//  Honour
//
//  Created by Jean Pimentel on 4/30/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Rule : Hashable {

    public var hashValue : Int {
        return ObjectIdentifier(self).hashValue
    }

    public init() {
    }

    public func validate(value: String) -> Bool {
        return false
    }

}

public func ==(lhs: Rule, rhs: Rule) -> Bool {
    return lhs.hashValue == rhs.hashValue
}