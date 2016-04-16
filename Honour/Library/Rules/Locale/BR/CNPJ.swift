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
            
            let numbers = v.characters.filter({"0123456789".characters.contains($0)})
            if numbers.count != 14 {
                return false
            }
            
            
            if self.strict && v.characters.count != 14 {
                return false
            }
            
            
            var n, i : Int
            let b = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
            
            for n = 0, i = 0; i < 12; n += Int(String(numbers[i]))! * b[++i] {}
            n %= 11
            
            if Int(String(numbers[12]))! != (n < 2 ? 0 : 11 - n) {
                return false
            }
            
            for n = 0, i = 0; i < 12; n += Int(String(numbers[i]))! * b[i++] {}
            n %= 11
            
            if Int(String(numbers[13]))! != (n < 2 ? 0 : 11 - n) {
                return false
            }
            
            return true
            
        }
        
        return false
    }
}