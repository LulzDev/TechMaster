//
//  ViewController.swift
//  Xu-Ly-Day-So
//
//  Created by lulzDev on 10/12/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit


extension Double {
    func absolute() -> Double {
        if self < 0 {
            return self * (-1)
        }
        return self
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var arrayLabel: UILabel!
    @IBOutlet weak var resultLabel: UITextView!
    
    var numberArray: [Int] = []
    var arrayString: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addNumber(sender: AnyObject) {
        arrayString = ""
        if resultLabel.text != "" {
            resultLabel.text = ""
        }
        if let num: Int = input.text.toInt() {
            numberArray.append(num)
            input.text = ""
            for i in numberArray {
                arrayString += "\(i)\t"
            }
            arrayLabel.text = arrayString
        }
    }

    @IBAction func calculate(sender: AnyObject) {
        var min: Int = numberArray[0]
        var max: Int = numberArray[0]
        var index: Int = 0, sum: Int = 0
        var minDifferent: Double = 0.0
        var approximatelyAverage: Int = 0
        
        for num in numberArray {
            if num > max {
                max = num
            } else if num < min {
                min = num
            }
            index++
            sum += num
        }
        var average: Double = Double(sum) / Double(index)
        minDifferent = (Double(numberArray[0]) - average).absolute()
        approximatelyAverage = numberArray[0]
        for num in numberArray {
            let minDiff: Double = (Double(num) - average).absolute()
            if minDiff < minDifferent {
                minDifferent = minDiff
                approximatelyAverage = num
            }
        }
        
        var resultString = "Min : \(min) \nMax : \(max)\nAverage : \(average)\nNumber is approximately average : \(approximatelyAverage)"
        resultLabel.text = resultString
        
        numberArray = []
    }
    
}

