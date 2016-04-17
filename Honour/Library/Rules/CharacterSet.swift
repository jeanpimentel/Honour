//
//  CharacterSet.swift
//  Honour
//
//  Created by Jean Fellipe de Almeida Pimentel on 4/16/16.
//  Copyright (c) 2016 Honour. All rights reserved.
//

import Foundation

public class CharacterSet: Rule {
    
    private var characterSet: NSCharacterSet
    
    public init(characterSet: NSCharacterSet) {
        self.characterSet = characterSet;
    }
    
    public init(_ characterSet: NSCharacterSet) {
        self.characterSet = characterSet;
    }

    public override func validate(value: AnyObject) -> Bool {
        
        guard let v = value as? String else {
            return false
        }
        
        for unicode in v.unicodeScalars {
            if !characterSet.longCharacterIsMember(unicode.value) {
                return false
            }
        }
        
        return true
    }
}