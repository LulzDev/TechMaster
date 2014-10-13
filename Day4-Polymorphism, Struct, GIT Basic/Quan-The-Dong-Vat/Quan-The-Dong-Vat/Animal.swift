//
//  Animal.swift
//  Quan-The-Dong-Vat
//
//  Created by lulzDev on 10/12/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import Foundation
enum AnimalGender: String {
    case Male = "Male"
    case Female = "Female"
    
}

class Animal {
    var age: Int {return 100}
    var adult: Int {return 50}
    var gender: AnimalGender
    var name: String
    var canMate: Bool
    
    init(name: String) {
        let index = arc4random() % 2
        var gnd: AnimalGender
        if index == 0 {
            gnd = AnimalGender.Female
        } else {
            gnd = AnimalGender.Male
        }
        self.name = name
        self.gender = gnd
        self.canMate = true
    }
    
    func mate(other: Animal) -> Animal {
        var newAnimal = Animal(name: "New Animal")
        return newAnimal
    }
}