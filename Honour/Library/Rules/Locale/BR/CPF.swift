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

        guard let input = value as? String else {
            return false
        }
        
        if self.strict && input.characters.count != 11 {
            return false
        }
        
        
        let numbers = input.characters.filter({"0123456789".characters.contains($0)})
        if numbers.count != 11 {
            return false
        }
        
        var allEquals = true
        for number in numbers {
            if number != numbers[0] {
                allEquals = false
            }
        }
        if allEquals {
            return false
        }

        
        // First digit
        var digit = 9
        var sum = 0
        for i in 0..<digit {
            guard let n = Int(String(numbers[i])) else {
                return false
            }
            sum += n * ((digit + 1) - i)
        }
        
        if let firstDigit = Int(String(numbers[digit])) where firstDigit != ((10 * sum) % 11) % 10 {
            return false
        }
        
        
        // Second digit
        digit = 10
        sum = 0
        for i in 0..<digit {
            guard let n = Int(String(numbers[i])) else {
                return false
            }
            sum += n * ((digit + 1) - i)
        }
        
        if let secondDigit = Int(String(numbers[digit])) where secondDigit != ((10 * sum) % 11) % 10 {
            return false
        }
        
        
        return true
    }
    
}