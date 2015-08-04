//
//  HexRGBColor.swift
//  Honour
//
//  Created by Jean Pimentel on 7/23/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class HexRGBColor: Regex {

    public init() {
        super.init(regex: "^#?([a-fA-F0-9]{3}){1,2}$")
    }
    
}