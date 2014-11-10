//
//  ViewController.swift
//  Day12-Autolayout
//
//  Created by LulzDev on 11/10/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var news1: UIWebView!
    var news2: UIWebView!
    
    //Portrait orientation
    var portraitConstraints1, portraitConstraints2, portraitConstraints3: [AnyObject]?
    var portraitSingleConstraint1, portraitSingleConstraint2: NSLayoutConstraint?
    
    var landscapeConstraints1, landscapeConstraints2, landscapeConstraints3: [AnyObject]?
    var landscapeSingleConstraint1, landscapeSingleConstraint2: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        news1 = UIWebView()
        let marsFilePath = NSBundle.mainBundle().pathForResource("mars", ofType: "html")
        var marsData = NSData(contentsOfFile: marsFilePath!)
        news1.loadData(marsData, MIMEType: "text/html", textEncodingName: "utf-8", baseURL: NSBundle.mainBundle().bundleURL)
        self.view .addSubview(news1)
        news1.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        news2 = UIWebView()
        let mercuryFilePath = NSBundle.mainBundle().pathForResource("mercury", ofType: "html")
        var mercuryData = NSData(contentsOfFile: mercuryFilePath!)
        news2.loadData(mercuryData, MIMEType: "text/html", textEncodingName: "utf-8", baseURL: NSBundle.mainBundle().bundleURL)
        self.view .addSubview(news2)
        news2.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        portraitConstraint()
        landscapeConstraint()
        switchConstraints(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func portraitConstraint() {
        let views = ["view": self.view, "news1": news1, "news2": news2];
        portraitConstraints1 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-20.0-[news1]-20.0-[news2]-20.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(portraitConstraints1!)
        
        portraitConstraints2 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20.0-[news1]-20.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(portraitConstraints2!)
        
        portraitConstraints3 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20.0-[news2]-20.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(portraitConstraints3!)
        
        portraitSingleConstraint1 = NSLayoutConstraint(item: news1, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: news2, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(portraitSingleConstraint1!)
        
        portraitSingleConstraint2 = NSLayoutConstraint(item: news1, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: news2, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(portraitSingleConstraint2!)
    }
    
    func landscapeConstraint() {
        let views = ["view": self.view, "news1": news1, "news2": news2]
        
        landscapeConstraints1 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20.0-[news1]-20.0-[news2]-20.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(landscapeConstraints1!)
        
        landscapeConstraints2 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-20.0-[news1]-20.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(landscapeConstraints2!)
        
        landscapeConstraints3 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-20.0-[news2]-20.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(landscapeConstraints3!)
        
        landscapeSingleConstraint1 = NSLayoutConstraint(item: news1, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: news2, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(landscapeSingleConstraint1!)
        
        landscapeSingleConstraint2 = NSLayoutConstraint(item: news1, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: news2, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(landscapeSingleConstraint2!)
    }
    
    func switchConstraints(portrait: Bool) {
        if portrait {
            NSLayoutConstraint.deactivateConstraints(landscapeConstraints1!)
            NSLayoutConstraint.deactivateConstraints(landscapeConstraints2!)
            NSLayoutConstraint.deactivateConstraints(landscapeConstraints3!)
            landscapeSingleConstraint1!.active = false
            landscapeSingleConstraint2!.active = false
            
            NSLayoutConstraint.activateConstraints(portraitConstraints1!)
            NSLayoutConstraint.activateConstraints(portraitConstraints2!)
            NSLayoutConstraint.activateConstraints(portraitConstraints3!)
            portraitSingleConstraint1!.active = true
            portraitSingleConstraint2!.active = true
        } else {
            NSLayoutConstraint.deactivateConstraints(portraitConstraints1!)
            NSLayoutConstraint.deactivateConstraints(portraitConstraints2!)
            NSLayoutConstraint.deactivateConstraints(portraitConstraints3!)
            portraitSingleConstraint1!.active = false
            portraitSingleConstraint2!.active = false
            
            NSLayoutConstraint.activateConstraints(landscapeConstraints1!)
            NSLayoutConstraint.activateConstraints(landscapeConstraints2!)
            NSLayoutConstraint.activateConstraints(landscapeConstraints3!)
            landscapeSingleConstraint1!.active = true
            landscapeSingleConstraint2!.active = true
        }
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        let screenSize = self.view.bounds.size
        if screenSize.width < screenSize.height {
            switchConstraints(true)
        } else {
            switchConstraints(false)
        }
    }

}

