//
//  UIImage+Photo.swift
//  RandomPhoto
//
//  Created by LulzDev on 11/3/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit
import Foundation

extension UIImageView {
    func makeItCool() {
        self.layer.masksToBounds = false
        
        // put a white border around the image view to make the image stand out from the background
        self.layer.borderWidth = 5.0
        self.layer.borderColor = UIColor.whiteColor().CGColor
        
        // add a shadow behind the image view to make it stand out even more
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.85
        self.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shouldRasterize = true
        
        let transform = CGAffineTransformMakeRotation(((CGFloat(rand()) / CGFloat(RAND_MAX)) - 0.5) * 0.4)
        self.transform = transform
    }
    
    func addGestureRecognizer() {
        self.userInteractionEnabled = true
        self.multipleTouchEnabled = true
        
        let rotateRecognizer = UIRotationGestureRecognizer(target: self, action: "rotateMe:")
        self.addGestureRecognizer(rotateRecognizer)
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: "pinchMe:")
        self.addGestureRecognizer(pinchRecognizer)
    }
    
    func rotateMe(sender: UIRotationGestureRecognizer) {
        let transform = CGAffineTransformMakeRotation(sender.rotation)
        self.transform = transform
    }
    
    func pinchMe(sender: UIPinchGestureRecognizer) {
        let transform = CGAffineTransformMakeScale(sender.scale, sender.scale)
        self.transform = transform
    }
}
