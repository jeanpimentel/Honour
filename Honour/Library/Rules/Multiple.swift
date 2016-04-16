//
//  Multiple.swift
//  Honour
//
//  Created by Filipe Faria on 24/08/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Multiple: Rule {
    
    private var multipleOf: NSNumber
    private var epsilon: Double
    
    public init(of: NSNumber, ε: Double = 1e-15){
        self.multipleOf = of
        self.epsilon = ε
    }
    
    public override func validate(value: AnyObject) -> Bool {
        
        if let v = value as? NSNumber {
            
            if multipleOf == 0 {
                return v == 0
            }
            
            let q = (Int)(v.doubleValue / multipleOf.doubleValue)
            let r = NSNumber(double: (Double(q) * multipleOf.doubleValue))
            
            return abs(r.doubleValue - v.doubleValue) < epsilon;
        }
        
        return false
    }
    
}