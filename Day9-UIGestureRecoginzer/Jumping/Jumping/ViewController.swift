//
//  ViewController.swift
//  Jumping
//
//  Created by LulzDev on 11/3/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var greenBox: UIView?
    
    var animator: UIDynamicAnimator?
    
    var collision: UICollisionBehavior?
    var push: UIPushBehavior?
    
    var tapGesture: UITapGestureRecognizer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        greenBox = UIView(frame: CGRectMake(CGRectGetMidX(self.view.frame) - 50, CGRectGetMidY(self.view.frame) - 50, 100, 100))
        greenBox!.backgroundColor = UIColor.greenColor()
        greenBox!.transform = CGAffineTransformMakeRotation(CGFloat(M_PI)/6)
        
        self.view.addSubview(greenBox!);
        
        animator = UIDynamicAnimator(referenceView: self.view);
        
        
        self.collision = UICollisionBehavior(items: [self.greenBox!]);
        self.collision!.translatesReferenceBoundsIntoBoundary = true;
        animator!.addBehavior(self.collision);
        
        push = UIPushBehavior(items: [self.greenBox!], mode: UIPushBehaviorMode.Instantaneous);
        push!.setAngle( CGFloat(M_PI) / -2 , magnitude: 8);
        animator!.addBehavior(push);
        
        
        var tap = UITapGestureRecognizer(target: self, action: "tapMe:")
        self.greenBox!.addGestureRecognizer(tap);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tapMe(tap: UITapGestureRecognizer) {
        
        push!.active = false;
        push!.setAngle( CGFloat(M_PI) / -2 , magnitude: 8);
        push!.active = true;
    }

}

