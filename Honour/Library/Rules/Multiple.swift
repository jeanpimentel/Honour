//
//  Multiple.swift
//  Honour
//
//  Created by Filipe Faria on 24/08/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Multiple : Rule {
    
    private var mult : NSNumber
    
    public init(mult: NSNumber){
        self.mult = mult;
    }
    
    public override func validate(value: AnyObject) -> Bool {
        
        if let v = value as? NSNumber {
            
            if self.mult == 0 || v == 0  {
                return false
            }
            
            var multDouble = self.mult.doubleValue
            var vDouble = v.doubleValue
            
            print("v = \(v) e self.mult = \(self.mult) \n\n")
            let result = (Int)(vDouble / multDouble)
            let resultTest = NSNumber(double: (Double(result) * multDouble))
            
            return abs(Double(resultTest.doubleValue - vDouble)) < 1e-15;
        }
        
        return false
    }
    
}