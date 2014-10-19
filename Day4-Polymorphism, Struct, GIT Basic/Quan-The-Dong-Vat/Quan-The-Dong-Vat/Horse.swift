//
//  Horse.swift
//  Quan-The-Dong-Vat
//
//  Created by LulzDev on 10/13/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import Foundation

class Horse: Animal {
    
    override func mate(other: Animal) -> Animal {
        var aHorse = Horse(name: "A horse", age: 37, adult: 13)
        return aHorse
    }
}