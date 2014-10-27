//
//  AlphaProperty.swift
//  Day08Exercise
//
//  Created by LulzDev on 10/27/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit

class AlphaProperty: UIViewController {

    var imageBox: UIImageView!
    var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        imageBox = UIImageView(frame: CGRect(x: 20, y: 20, width: self.view.bounds.size.width - 40, height: 300))
        imageBox.image = UIImage(named: "vic.jpg")
        self.view.addSubview(imageBox)
        
        slider = UISlider(frame: CGRect(x: 20, y: 340, width: self.view.bounds.size.width - 40, height: 30))
        slider.value = 0.7
        slider.addTarget(self, action: "onSliderChange:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(slider)
        
        imageBox.alpha = CGFloat(slider.value)
        
    }
    
    func onSliderChange(sender: UISlider) {
        imageBox.alpha = CGFloat(sender.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
