//
//  CPF.swift
//  Honour
//
//  Created by Jean Pimentel on 5/18/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class BR_CPF : Rule {

    private var strict: Bool

    public init(strict: Bool = false) {
        self.strict = strict;
    }

    public init(_ strict: Bool = false) {
        self.strict = strict;
    }

    public override func validate(value: AnyObject) -> Bool {

        if let v = value as? String {

            let numbers = v.characters.filter({"0123456789".characters.contains($0)})
            if numbers.count != 11 {
                return false
            }


            if self.strict && v.characters.count != 11 {
                return false
            }


            var allEquals = true
            for char in numbers {
                if char != numbers[0] {
                    allEquals = false
                }
            }
            if allEquals {
                return false
            }


            var s, n, i : Int

            // First digit
            for s = 10, n = 0, i = 0; s >= 2; n += Int(String(numbers[i++]))! * s-- {}
            n %= 11

            if Int(String(numbers[9]))! != (n < 2 ? 0 : 11 - n) {
                return false
            }

            // Second digit
            for s = 11, n = 0, i = 0; s >= 2; n += Int(String(numbers[i++]))! * s-- {}
            n %= 11
            
            if Int(String(numbers[10]))! != (n < 2 ? 0 : 11 - n) {
                return false
            }
            
            return true

        }

        return false
    }
}