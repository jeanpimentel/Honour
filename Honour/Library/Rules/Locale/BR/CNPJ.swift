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
        
        if let v = value as? String {
            
            let numbers = filter(v, {contains("0123456789", $0)})
            if numbers.count != 14 {
                return false
            }
            
            
            if self.strict && count(v) != 14 {
                return false
            }
            
            
            var n, i : Int
            let b = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
            
            for n = 0, i = 0; i < 12; n += String(numbers[i]).toInt()! * b[++i] {}
            n %= 11
            
            if String(numbers[12]).toInt()! != (n < 2 ? 0 : 11 - n) {
                return false
            }
            
            for n = 0, i = 0; i < 12; n += String(numbers[i]).toInt()! * b[i++] {}
            n %= 11
            
            if String(numbers[13]).toInt()! != (n < 2 ? 0 : 11 - n) {
                return false
            }
            
            return true
            
        }
        
        return false
    }
}