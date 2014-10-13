//
//  Dog.swift
//  Quan-The-Dong-Vat
//
//  Created by lulzDev on 10/12/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import Foundation

class Dog: Animal {
    override var age: Int {
        return 20
    }
    override var adult: Int {
        return 3
    }
    
    override func mate(other: Animal) -> Animal {
        
        var newDog = Dog(name: "New Dog")
        return newDog
    }
}