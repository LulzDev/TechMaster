//
//  FlipView.swift
//  Day08Exercise
//
//  Created by LulzDev on 10/27/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit

class FlipView: UIView {
    
    var frontImage: UIImage!
    var backImage: UIImage!
    private var frontView: UIImageView!
    private var backView: UIImageView!
    private var backupView: UIImageView = UIImageView()
    private var isFrontFace: Bool = true
    
    override func layoutSubviews() {
        let tapA = UITapGestureRecognizer(target: self, action: "flip:")
        self.addGestureRecognizer(tapA)
        
        frontView = UIImageView(image: frontImage)
        frontView.frame = self.bounds
        self.addSubview(frontView)
        
        backView = UIImageView(image: backImage)
        backView.frame = self.bounds
        isFrontFace = true
    }
    
    func flip(recognizer: UITapGestureRecognizer) {
        if isFrontFace == true {
            UIView.transitionWithView(self, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromTop, animations: { () -> Void in
                self.addSubview(self.backView)
                self.backupView = self.frontView
                self.frontView.removeFromSuperview()
            }, completion: { (finished) -> Void in
                self.isFrontFace = false
            })
        } else {
            UIView.transitionWithView(self, duration: 1, options: UIViewAnimationOptions.TransitionCurlUp, animations: { () -> Void in
                self.addSubview(self.backupView)
                self.backupView = self.backView
                self.backView.removeFromSuperview()
            }, completion: { (finished) -> Void in
                self.isFrontFace = true
            })
            
        }
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
