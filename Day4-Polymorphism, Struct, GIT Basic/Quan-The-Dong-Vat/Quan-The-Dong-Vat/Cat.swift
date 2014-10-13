//
//  Cat.swift
//  Quan-The-Dong-Vat
//
//  Created by LulzDev on 10/13/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import Foundation

class Cat: Animal {
    override var age: Int {
        return 12
    }
    override var adult: Int {
        return 3
    }
    
    override func mate(other: Animal) -> Animal {
        var aCat = Cat(name: "New Cat")
        return aCat
    }
}