//
//  CNPJ.swift
//  Honour
//
//  Created by Jean Fellipe de Almeida Pimentel on 8/26/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class BR_CNPJ : Rule {
    
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
        
        if self.strict && input.characters.count != 14 {
            return false
        }

        
        let numbers = input.characters.filter({"0123456789".characters.contains($0)})
        if numbers.count != 14 {
            return false
        }
        
            
        let weight = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
        
        
        // First digit
        var sum = 0
        for i in 0...11 {
            guard let n = Int(String(numbers[i])) else {
                return false
            }
            
            sum += n * weight[i + 1]
        }
        
        if let firstDigit = Int(String(numbers[12])) where firstDigit != ((10 * sum) % 11) % 10 {
            return false
        }
        
        
        // Second digit
        sum = 0
        for i in 0...12 {
            guard let n = Int(String(numbers[i])) else {
                return false
            }
            
            sum += n * weight[i]
        }
        
        if let secondDigit = Int(String(numbers[13])) where secondDigit != ((10 * sum) % 11) % 10 {
            return false
        }
        
        return true
    }
}