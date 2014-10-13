//
//  Tiger.swift
//  Quan-The-Dong-Vat
//
//  Created by lulzDev on 10/13/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import Foundation

class Tiger: Animal {
    override var age: Int {
        return 50
    }
    override var adult: Int {
        return 20
    }
    
    override func mate(other: Animal) -> Animal {
        var aTiger = Tiger(name: "New Tiger")
        return aTiger
    }
    
}