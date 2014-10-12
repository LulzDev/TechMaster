//
//  ViewController.swift
//  Dao-Nguoc-Van-Ban
//
//  Created by lulzDev on 10/12/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    var isFirst: Bool = true
    var originalString: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func reverseText(sender: AnyObject) {
        if isFirst {
            originalString = input.text
            isFirst = false
        }
        
        var inputString: String = ""
        var reversedString: String = ""
        
        if let str = input.text {
            inputString = str
            var inputArray: [Character] = [Character]()
            for character in inputString {
                inputArray.append(character)
            }
            
            for var index = inputArray.count - 1; index >= 0; --index {
                reversedString += String(inputArray[index])
            }
            input.text = reversedString
            
            if reversedString == originalString {
                statusLabel.text = "Chuỗi ban đầu"
            } else {
                statusLabel.text = "Chuỗi đã đảo ngược"
            }
            
        } else {
            statusLabel.text = "Vui lòng nhập văn bản"
        }
        
    }

    @IBAction func clear(sender: AnyObject) {
        isFirst = true
        originalString = ""
        input.text = ""
        statusLabel.text = nil
    }
}

