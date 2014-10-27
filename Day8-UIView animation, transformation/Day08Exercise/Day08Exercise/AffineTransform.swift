//
//  AffineTransform.swift
//  Day08Exercise
//
//  Created by LulzDev on 10/27/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit

class AffineTransform: UIViewController {

    var imageBox: UIImageView!
    var rotateSlider: UISlider!
    var scaleSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        imageBox = UIImageView(frame: CGRect(x: (self.view.bounds.size.width - 100) / 2, y: 40, width: 100, height: 100))
        imageBox.image = UIImage(named: "doremon")
        self.view.addSubview(imageBox)
        
        rotateSlider = UISlider(frame: CGRect(x: 10, y: 340, width: self.view.bounds.size.width - 20, height: 30))
        rotateSlider.value = 0.0
        rotateSlider.addTarget(self, action: "rotate", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(rotateSlider)
        
        scaleSlider = UISlider(frame: CGRect(x: 10, y: 390, width: self.view.bounds.size.width - 20, height: 30))
        scaleSlider.value = 0.5
        scaleSlider.addTarget(self, action: "scale", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(scaleSlider)
        
        self.rotateAndScale()
    }
    
    func rotate() {
        self.rotateAndScale()
    }
    
    func scale() {
        self.rotateAndScale()
    }
    
    func rotateAndScale() {
        let scaleRatio = scaleSlider.value * 4.0
        
        imageBox.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(CGFloat(M_PI) * CGFloat(rotateSlider.value)), CGAffineTransformMakeScale(CGFloat(scaleRatio), CGFloat(scaleRatio)))
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
