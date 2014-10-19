//
//  ViewController.swift
//  Dao-Nguoc-Van-Ban
//
//  Created by lulzDev on 10/12/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit

extension String {
    func reverseString() -> String {
        var reversedString: String = ""
        var inputArray: [Character] = [Character]()
        for character in self {
            inputArray.append(character)
        }
        
        for var index = inputArray.count - 1; index >= 0; --index {
            reversedString += String(inputArray[index])
        }
        return reversedString
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var input: UITextView!
    @IBOutlet weak var statusLabel: UILabel!
    
    var originalString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        originalString = readFile("test", fileType: "txt")
        input.text = originalString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


    @IBAction func reverseText(sender: AnyObject) {
        var reversedString: String = ""

        var inputString = input.text
        reversedString = inputString.reverseString()
        input.text = reversedString
            
        if reversedString == originalString {
            statusLabel.text = "Chuỗi ban đầu"
        } else {
            statusLabel.text = "Chuỗi đã đảo ngược"
        }
    }
    
    func readFile(fileName: String, fileType: String) -> String {
        var fileRoot = NSBundle.mainBundle().pathForResource(fileName, ofType: fileType)
        var content = String.stringWithContentsOfFile(fileRoot!, encoding: NSUTF8StringEncoding, error: nil)
        return content!
    }
}

