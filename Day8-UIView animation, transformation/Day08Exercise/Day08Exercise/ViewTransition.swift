//
//  ViewTransition.swift
//  Day08Exercise
//
//  Created by LulzDev on 10/27/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit

class ViewTransition: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        let flipView = FlipView()
        flipView.frame = CGRect(x: (self.view.bounds.size.width - 200) / 2, y: 10, width: 200, height: 290)
        flipView.frontImage = UIImage(named: "backImage.jpg")
        flipView.backImage = UIImage(named: "frontImage.jpg")
        self.view.addSubview(flipView)
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
