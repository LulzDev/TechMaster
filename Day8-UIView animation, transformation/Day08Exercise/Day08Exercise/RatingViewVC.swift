//
//  RatingViewVC.swift
//  Day08Exercise
//
//  Created by LulzDev on 10/27/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit

class RatingViewVC: UIViewController {

    var ratingView: RateView!
    var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        ratingView = RateView()
        
        ratingView.frame = CGRect(x: (self.view.bounds.size.width - 124) / 2, y: 100, width: 124, height: 32)
        ratingView.image = UIImage(named: "5star")

        self.view.addSubview(ratingView)
        
        slider = UISlider(frame: CGRect(x: (self.view.bounds.size.width - 124) / 2, y: 142, width: 124, height: 30))
        slider.minimumValue = 0.0
        slider.maximumValue = 5.0
        slider.value = 2.5
        slider.addTarget(self, action: "onSliderChange:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(slider)
        ratingView.value = slider.value
    }
    
    func onSliderChange(sender: UISlider) {
        ratingView.value = sender.value
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
