//
//  DemoAnimal.swift
//  Quan-The-Dong-Vat
//
//  Created by lulzDev on 10/12/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit

infix operator >!< {}
func >!< (animal1: Animal, animal2: Animal) -> Bool {
    return (object_getClassName(animal1) == object_getClassName(animal2))
}

class DemoAnimal: NSObject {
   
    var animalArrays: [Animal] = [Animal]()
    
    func addAnimal() {
        for var index = 0; index < 1000; index++ {
            
            let random = arc4random() % 6
            switch random {
            case 0:
                var aAnimal: Dog
                aAnimal = Dog(name: "A dog")
                animalArrays.append(aAnimal)
            case 1:
                var aAnimal: Tiger
                aAnimal = Tiger(name: "A tiger")
                animalArrays.append(aAnimal)
            case 2:
                var aAnimal: Cat
                aAnimal = Cat(name: "A cat")
                animalArrays.append(aAnimal)
            case 3:
                var aAnimal: Puma
                aAnimal = Puma(name: "A puma")
                animalArrays.append(aAnimal)
            case 4:
                var aAnimal: Horse
                aAnimal = Horse(name: "A horse")
                animalArrays.append(aAnimal)
            case 5:
                var aAnimal: Rabbit
                aAnimal = Rabbit(name: "A rabbit")
                animalArrays.append(aAnimal)
            default:
                var aAnimal: Animal
                aAnimal = Animal(name: "A animal")
                animalArrays.append(aAnimal)
            }
            
        }
    }
    
    func showAnimals() {
        let numberOfAnimal = animalArrays.count
        println("Number of animals : \(numberOfAnimal)")
    }
    
    func getLifeCircle() {
        for var index = 1; index <= 50; index++ {
            for var i = 0; i < animalArrays.count - 2; i++ {
                var animal1 = animalArrays[i]
                if index == animal1.age {
                    animalArrays.removeAtIndex(i)
                    continue
                }
                for var j = i + 1; j < animalArrays.count - 1;  j++ {
                    
                    var animal2 = animalArrays[j]
                    if index == animal2.age {
                        animalArrays.removeAtIndex(j)
                        continue
                    }
                    if (animal1 >!< animal2) && (animal1.gender.toRaw() != animal2.gender.toRaw()) && animal1.canMate && animal2.canMate {
                        if i == animal1.adult {
                            var newAnimal = animal1.mate(animal2)
                            animalArrays.append(newAnimal)
                            animal1.canMate = false
                            animal2.canMate = false
                        }
                    }
                }
            }
        }
    }
    
}
