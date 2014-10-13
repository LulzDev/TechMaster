//
//  Rabbit.swift
//  Quan-The-Dong-Vat
//
//  Created by LulzDev on 10/13/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import Foundation

class Rabbit: Animal {
    override var age: Int {
        return 3
    }
    override var adult: Int {
        return 1
    }
    
    override func mate(other: Animal) -> Animal {
        var aRabbit = Rabbit(name: "New Rabbit")
        return aRabbit
    }
}