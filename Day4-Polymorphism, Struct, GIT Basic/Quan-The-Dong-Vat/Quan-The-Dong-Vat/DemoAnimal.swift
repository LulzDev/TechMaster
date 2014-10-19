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
//        for var index = 0; index < 1000; index++ {
//            
//            let random = arc4random() % 6
//            switch random {
//            case 0:
//                var aAnimal: Dog
//                aAnimal = Dog(name: "A dog", age: 20, adult: 3)
//                animalArrays.append(aAnimal)
//            case 1:
//                var aAnimal: Tiger
//                aAnimal = Tiger(name: "A tiger", age: 50, adult: 20)
//                animalArrays.append(aAnimal)
//            case 2:
//                var aAnimal: Cat
//                aAnimal = Cat(name: "A cat", age: 12, adult: 3)
//                animalArrays.append(aAnimal)
//            case 3:
//                var aAnimal: Puma
//                aAnimal = Puma(name: "A puma", age: 45, adult: 18)
//                animalArrays.append(aAnimal)
//            case 4:
//                var aAnimal: Horse
//                aAnimal = Horse(name: "A horse", age: 37, adult: 13)
//                animalArrays.append(aAnimal)
//            case 5:
//                var aAnimal: Rabbit
//                aAnimal = Rabbit(name: "A rabbit", age: 3, adult: 1)
//                animalArrays.append(aAnimal)
//            default:
//                var aAnimal: Animal
//                aAnimal = Animal(name: "An animal", age: 100, adult: 50)
//                animalArrays.append(aAnimal)
//            }
//            
//        }
        
        for var i = 0; i < 10; i++ {
            var animal = Dog(name: "A dog", age: 20, adult: 3)
            animalArrays.append(animal)
        }
        for var i = 0; i < 10; i++ {
            var animal = Cat(name: "A cat", age: 12, adult: 3)
            animalArrays.append(animal)
        }
        for var i = 0; i < 5; i++ {
            var animal = Horse(name: "A horse", age: 37, adult: 13)
            animalArrays.append(animal)
        }
        
    }
    
    func showAnimals() {
        let numberOfAnimal = animalArrays.count
        println("Number of animals : \(numberOfAnimal)")


    }
    
    func getLifeCircle() {
        for var index = 1; index <= 50; index++ {
            for var i = 0; i < animalArrays.count - 1; i++ {
                var animal1 = animalArrays[i]
                if animal1.currentAge == animal1.age {
                    animalArrays.removeAtIndex(i)
                    continue
                }
                animal1.incrementAge()
                for var j = i + 1; j < animalArrays.count;  j++ {
                    var animal2 = animalArrays[j]
                    if animal2.currentAge == animal2.age {
                        animalArrays.removeAtIndex(j)
                        continue
                    }
                    animal2.incrementAge()
                    if (animal1 >!< animal2) && (animal1.gender.toRaw() != animal2.gender.toRaw()) && animal1.canMate && animal2.canMate {
                        if animal1.currentAge == animal1.adult {
                            var newAnimal = animal1.mate(animal2)
                            animalArrays.append(newAnimal)
                            animal1.canMate = false
                            animal2.canMate = false
                            showAnimals()
                        }
                    }
                }
            }
        }
    }
    
}
