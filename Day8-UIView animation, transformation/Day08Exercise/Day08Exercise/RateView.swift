//
//  RateView.swift
//  Day08Exercise
//
//  Created by LulzDev on 10/27/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit

class RateView: UIImageView {

    var value: Float {
        get {
            return self.value
        }
        set {
            if newValue < 0 || newValue > 5 {
                return
            } else {
                self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: CGFloat(fullWidth) * CGFloat(newValue) / 5.0, height: self.frame.size.height)
            }
        }
    }
    
    private var fullWidth: Float!
    
    override func layoutSubviews() {
        fullWidth = Float(self.bounds.size.width)
    }
    
}
