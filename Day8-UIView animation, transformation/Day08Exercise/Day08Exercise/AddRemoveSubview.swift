//
//  AddRemoveSubview.swift
//  Day08Exercise
//
//  Created by LulzDev on 10/27/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit

class AddRemoveSubview: UIViewController {
    
    var currentTopview: UIView!
    var currentGrayColor: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let addButton = UIButton(frame: CGRect(x: 20, y: self.view.bounds.size.height - 50, width: 50, height: 30))
        addButton.setTitle("Add", forState: UIControlState.Normal)
        addButton.addTarget(self, action: "addSubview", forControlEvents: UIControlEvents.TouchUpInside)
        addButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.view.addSubview(addButton)
        
        let removeButton = UIButton(frame: CGRect(x: self.view.bounds.size.width - 90, y: self.view.bounds.size.height - 50, width: 50, height: 30))
        removeButton.setTitle("Remove", forState: UIControlState.Normal)
        removeButton.addTarget(self, action: "removeSubview", forControlEvents: UIControlEvents.TouchUpInside)
        removeButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        removeButton.sizeToFit()
        self.view.addSubview(removeButton)
        
        currentTopview = self.view
        currentGrayColor = 1.0
    }
    
    func addSubview() {
        
        if currentTopview.bounds.size.width < 40 {
            return
        }
        
        let width = currentTopview.bounds.size.width - 20.0
        let childView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: width))
        childView.backgroundColor = UIColor(red: CGFloat(currentGrayColor), green: CGFloat(currentGrayColor), blue: CGFloat(currentGrayColor), alpha: 1.0)
        currentTopview.addSubview(childView)
        childView.center = CGPoint(x: currentTopview.bounds.size.width / 2, y: currentTopview.bounds.size.height/2)
        currentGrayColor = currentGrayColor - 0.1
        currentTopview = childView
    }
    
    func removeSubview() {
        let tobeRemovedView = currentTopview
        if tobeRemovedView != self.view {
            currentTopview = currentTopview.superview
            tobeRemovedView.removeFromSuperview()
            currentGrayColor = currentGrayColor + 0.1
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
