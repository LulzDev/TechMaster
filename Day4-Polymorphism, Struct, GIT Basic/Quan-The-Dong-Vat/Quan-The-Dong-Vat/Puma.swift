//
//  Puma.swift
//  Quan-The-Dong-Vat
//
//  Created by LulzDev on 10/13/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import Foundation

class Puma: Animal {
    override var age: Int {
        return 45
    }
    override var adult: Int {
        return 18
    }
    
    override func mate(other: Animal) -> Animal {
        var aPuma = Puma(name: "New Puma")
        return aPuma
    }
}