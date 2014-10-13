//
//  ViewController.swift
//  Quan-The-Dong-Vat
//
//  Created by lulzDev on 10/12/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var demo = DemoAnimal()
        demo.addAnimal()
        println("Animal before get life circle")
        demo.showAnimals()
        
        demo.getLifeCircle()
        
        println("Animal after get life circle")
        demo.showAnimals()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

