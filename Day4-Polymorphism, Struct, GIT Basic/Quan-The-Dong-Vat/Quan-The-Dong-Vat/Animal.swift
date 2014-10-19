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
    var age: Int
    var currentAge: Int = 0
    var adult: Int
    var gender: AnimalGender!
    var name: String
    var canMate: Bool = true
    
    
    init(name: String, age: Int, adult: Int) {
        self.name = name
        self.age = age
        self.adult = adult
        self.gender = getRandomGender()

    }
    
    func getRandomGender() -> AnimalGender {
        let index = arc4random() % 2
        var gnd: AnimalGender
        if index == 0 {
            return AnimalGender.Female
        } else {
            return AnimalGender.Male
        }
    }
    
    func incrementAge() {
        self.currentAge += 1
    }
    
    func mate(other: Animal) -> Animal {
        var newAnimal = Animal(name: "New animal", age: 100, adult: 50)
        return newAnimal
    }
}