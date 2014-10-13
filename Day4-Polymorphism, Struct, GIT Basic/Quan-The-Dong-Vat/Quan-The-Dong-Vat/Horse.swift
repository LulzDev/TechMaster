//
//  Horse.swift
//  Quan-The-Dong-Vat
//
//  Created by LulzDev on 10/13/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import Foundation

class Horse: Animal {
    override var age: Int {
        return 37
    }
    override var adult: Int {
        return 13
    }
    
    override func mate(other: Animal) -> Animal {
        var aHorse = Horse(name: "New Horse")
        return aHorse
    }
}