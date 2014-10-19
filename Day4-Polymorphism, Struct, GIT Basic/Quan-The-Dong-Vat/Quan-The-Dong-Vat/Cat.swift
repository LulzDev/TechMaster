//
//  Cat.swift
//  Quan-The-Dong-Vat
//
//  Created by LulzDev on 10/13/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import Foundation

class Cat: Animal {
    
    override func mate(other: Animal) -> Animal {
        var aCat = Cat(name: "A cat", age: 12, adult: 3)
        return aCat
    }
}