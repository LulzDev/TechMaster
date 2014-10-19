//
//  ViewController.swift
//  FirstUI
//
//  Created by Trinh Minh Cuong on 10/16/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloHell: UILabel!
    var button: UIButton?
    var timer = NSTimer()
    var imageView: UIImageView!
    var chessWidth: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        let maxWidth = self.view.bounds.size.width
        chessWidth = (maxWidth - 20.0) / 8.0
        
        for i in 0...7 {
            for j in 0...7 {
                let square = UIView(frame: CGRect(x: chessWidth * CGFloat(j) + 10.0, y: chessWidth * CGFloat(i) + 20.0, width: chessWidth, height: chessWidth))
                if i % 2 == 0 {
                    if j % 2 == 0 {
                        square.backgroundColor = UIColor.whiteColor()
                    } else {
                        square.backgroundColor = UIColor.blackColor()
                    }
                } else {
                    if j % 2 != 0 {
                        square.backgroundColor = UIColor.whiteColor()
                    } else {
                        square.backgroundColor = UIColor.blackColor()
                    }
                }
                
                self.view.addSubview(square)
            }
            
        }
        
        var bishop = UIImage(named: "bishop")
        imageView = UIImageView(frame: CGRect(x: 10, y: 20, width: chessWidth, height: chessWidth))
        imageView.image = bishop
        self.view.addSubview(imageView)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector:Selector("moveBishop"), userInfo: nil, repeats: true)
        
        
       // self.edgesForExtendedLayout = UIRectEdge.Top
      /*  let label = UILabel(frame: CGRect(x: 0, y: 30, width: 100, height: 30))
        label.text = "Hello World"
        label.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(label)
        
        helloHell.backgroundColor = UIColor.grayColor()
        helloHell.center = CGPoint(x: 100, y: 100)
        
        button = UIButton(frame: CGRect(x: 0, y: 130, width: 100, height: 30))
        button!.setTitle("Tap on me", forState: UIControlState.Normal)
        button!.addTarget(self, action: "tapMe", forControlEvents: UIControlEvents.TouchUpInside) //: cần có dấu : truyền vào
        button!.backgroundColor = UIColor.grayColor()
        self.view.addSubview(button!)*/

    }
    
    func moveBishop() {
        if imageView.center.y == chessWidth * 8.0 + 20.0 - chessWidth / 2.0 {
            timer.invalidate()
        } else {
            imageView.center = CGPoint(x: imageView.center.x + chessWidth, y: imageView.center.y + chessWidth)
        }
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    /*func tapMe() {
        println("Cool")
        button!.removeFromSuperview()
    }*/


}

