//
//  BlockAnimation.swift
//  Day08Exercise
//
//  Created by LulzDev on 10/27/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit

class BlockAnimation: UIViewController {

    var imageBox: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        imageBox = UIImageView(frame: CGRect(x:0, y: 0, width: 100, height: 100))
        imageBox.image = UIImage(named: "doremon")
        self.view.addSubview(imageBox)
        
        let animateButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        animateButton.setTitle("Animate!", forState: UIControlState.Normal)
        animateButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        animateButton.addTarget(self, action: "animateImage", forControlEvents: UIControlEvents.TouchUpInside)
        animateButton.sizeToFit()
        animateButton.center = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.size.height - 100)
        
        self.view.addSubview(animateButton)
    }
    
    func animateImage() {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.imageBox.center = CGPoint(x: 300, y: 400)
        }) { (finished) -> Void in
            self.imageBox.alpha = 0.5
        }
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
