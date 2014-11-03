//
//  ViewController.swift
//  RandomPhoto
//
//  Created by LulzDev on 11/3/14.
//  Copyright (c) 2014 LulzDev. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var trashButton: UIButton!
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    var photos: [String]?
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        photos = ["01.jpg", "02.jpg","03.jpg","04.jpg","05.jpg","06.jpg","07.jpg","08.jpg"]
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        let filePath = NSBundle.mainBundle().pathForResource("empty trash", ofType: "aif")
        let url = NSURL(fileURLWithPath: filePath!)
        var error: NSError?
        
        audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
        
        if error != nil {
            println("Error \(error!.description)")
            return
        }
        audioPlayer!.prepareToPlay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleTap(sender: UITapGestureRecognizer) {
        let index = Int(arc4random_uniform(8))
        let image = photos![index] as String
        var aPhoto = UIImageView(image: UIImage(named:image))
        aPhoto.center = sender.locationInView(self.view)
        aPhoto.makeItCool()
        aPhoto.addGestureRecognizer()
        self.view.addSubview(aPhoto)
        
        self.view.bringSubviewToFront(trashButton)
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        if touch.view == trashButton {
            return false
        }
        return true
    }
    
    @IBAction func clickOnTrash(sender: UIButton) {
        for (aView: UIView) in self.view.subviews as [UIView]{
            if aView.isMemberOfClass(UIImageView) {
                audioPlayer!.play()
                UIView.animateWithDuration(1.0, animations: { () -> Void in
                    aView.center = self.trashButton.center
                    let transform = CGAffineTransformMakeScale(0.1, 0.1)
                    aView.transform = transform
                    aView.alpha = 0.1
                }, completion: { (finished) -> Void in
                    aView.removeFromSuperview()
                })
            }
        }
        trashButton.imageView?.image = UIImage(named: "FullTrash")
    }
    
    
}

