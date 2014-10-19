//
//  Dog.swift
//  Quan-The-Dong-Vat
//
//  Created by lulzDev on 10/12/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import Foundation

class Dog: Animal {
    
    override func mate(other: Animal) -> Animal {
        
        var newDog = Dog(name: "A dog", age: 20, adult: 3)
        return newDog
    }
}