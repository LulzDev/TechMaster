//
//  Rabbit.swift
//  Quan-The-Dong-Vat
//
//  Created by LulzDev on 10/13/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import Foundation

class Rabbit: Animal {
    
    override func mate(other: Animal) -> Animal {
        var aRabbit = Rabbit(name: "A rabbit", age: 3, adult: 1)
        return aRabbit
    }
}