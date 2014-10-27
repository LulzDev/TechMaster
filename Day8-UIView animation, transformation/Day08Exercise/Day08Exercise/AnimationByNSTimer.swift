//
//  AnimationByNSTimer.swift
//  Day08Exercise
//
//  Created by LulzDev on 10/27/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit

class AnimationByNSTimer: UIViewController {

    let VX: Float = 10.0
    let VY: Float = 10.0
    
    var timer: NSTimer = NSTimer()
    var boundRect: CGRect!
    var _vX: Float!
    var _vY: Float!
    
    var imageBox: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        boundRect = self.view.bounds
        _vX = VX
        _vY = VY
        
        imageBox = UIImageView(frame: CGRect(x:0, y: 0, width: 100, height: 100))
        imageBox.image = UIImage(named: "doremon")
        self.view.addSubview(imageBox)
        
        let stopButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        stopButton.setTitle("Stop Animation!!", forState: UIControlState.Normal)
        stopButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        stopButton.addTarget(self, action: "stopAnimation", forControlEvents: UIControlEvents.TouchUpInside)
        stopButton.sizeToFit()
        stopButton.center = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.size.height - 100)
        
        self.view.addSubview(stopButton)
        
        self.startAnimation()
        
    }
    
    func startAnimation() {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "animateCat:", userInfo: nil, repeats: true)
    }
    
    func animateCat(theTimer: NSTimer) {
        var center: CGPoint = imageBox.center
        
        //Tao hieu ung va cham
        let size: CGSize = imageBox.bounds.size
        
        var newX = center.x + CGFloat(_vX)
        var newY = center.y + CGFloat(_vY)
        
        if (newX < size.width / 2) || newX > boundRect.width - (size.width / 2) {
            _vX = -_vX
        } else if (newY < (size.height / 2)) || newY > boundRect.size.height - (size.height / 2) - 40 {
            _vY = -_vY
        }
        
        newX = center.x + CGFloat(_vX)
        newY = center.y + CGFloat(_vY)
        
        imageBox.center = CGPoint(x: newX, y: newY)
    }
    
    func stopAnimation() {

            if timer.valid {
                timer.invalidate()
            } else {
                self.startAnimation()
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
