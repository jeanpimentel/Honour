//
//  Version.swift
//  Honour
//
//  Created by Jean Pimentel on 5/19/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Version: Regex {

    public init() {
        super.init(regex: "^[0-9]+\\.[0-9]+\\.[0-9]+([+-][^+-][0-9A-Za-z-.]*)?$")
    }

}