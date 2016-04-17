//
//  ASCII.swift
//  Honour
//
//  Created by Jean Fellipe de Almeida Pimentel on 4/16/16.
//  Copyright (c) 2016 Honour. All rights reserved.
//

import Foundation

public class ASCII: Rule {
    
    public override func validate(value: AnyObject) -> Bool {
        
        guard let v = value as? String else {
            return false
        }
        
        for char in v.unicodeScalars {
            if char.value > 127 {
                return false
            }
        }
        
        return true
    }

    
}