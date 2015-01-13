//
//  ViewController.swift
//  Animations
//
//  Created by Zach Ribera on 1/11/15.
//  Copyright (c) 2015 Zetch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var numberOfFishSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        // Create and add a colored square
//        let coloredSquare = UIView()
//        
//        // set background color to blue
//        coloredSquare.backgroundColor = UIColor.blueColor()
//        
//        // set frame (position and size) of the square
//        // iOS coordinate system starts at the top left of the screen
//        // so this square will be at top left of screen, 50x50pt
//        // CG in CGRect stands for Core Graphics
//        coloredSquare.frame = CGRect(x: 0, y: 120, width: 50, height: 50)
//        
//        // finally, add the square to the screen
//        self.view.addSubview(coloredSquare)
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        // lets set the duration to 1.0 seconds
//        // and in the animations block change the background color
//        // to red and the x-position  of the frame
////        UIView.animateWithDuration(1.0, animations: {
////            coloredSquare.backgroundColor = UIColor.redColor()
////            
////            // for the x-position I entered 320-50 (width of screen - width of the square)
////            // if you want, you could just enter 270
////            // but I prefer to enter the math as a reminder of what's happenings
////            coloredSquare.frame = CGRect(x: 320-50, y: 120, width: 50, height: 50)
////        })
//        let options = UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.CurveEaseInOut
//        
//        UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
//            
//            // any changes entered in this block will be animated
//            coloredSquare.backgroundColor = UIColor.redColor()
//            coloredSquare.frame = CGRect(x: 320-50, y: 120, width: 50, height: 50)
//            
//            }, completion: nil)
    }

    @IBAction func animateButtonPressed(sender: AnyObject) {
        let numberOfFish = Int(self.numberOfFishSlider.value)
        // set up some values to use in the curve
        let ovalStartAngle = CGFloat(90.01 * M_PI/180)
        let ovalEndAngle = CGFloat(90 * M_PI/180)
        let ovalRect = CGRectMake(97.5, 58.5, 125, 125)
        
        // create the bezier path
        let ovalPath = UIBezierPath()
        
        ovalPath.addArcWithCenter(CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)),
            radius: CGRectGetWidth(ovalRect) / 2,
            startAngle: ovalStartAngle,
            endAngle: ovalEndAngle, clockwise: true)
        
        // create an object that represents how the curve
        // should be presented on the screen
        let progressLine = CAShapeLayer()
        progressLine.path = ovalPath.CGPath
        progressLine.strokeColor = UIColor.blueColor().CGColor
        progressLine.fillColor = UIColor.whiteColor().CGColor
        progressLine.lineWidth = 10.0
        progressLine.lineCap = kCALineCapRound
        
        // add the curve to the screen
        self.view.layer.addSublayer(progressLine)
        
        // create a basic animation that animates the value 'strokeEnd'
        // from 0.0 to 1.0 over 3.0 seconds
        let animateStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animateStrokeEnd.duration = 10.0
        animateStrokeEnd.fromValue = 0.0
        animateStrokeEnd.toValue = 1.0
        
        // add the animation
        progressLine.addAnimation(animateStrokeEnd, forKey: "animate stroke end animation")

        
//        // loop from 0 to 5
//        for i in 0...numberOfFish {
//            
//            // create a square
//            let square = UIView()
//            square.frame = CGRect(x: 55, y: 300, width: 20, height: 20)
//            square.backgroundColor = UIColor.redColor()
//            self.view.addSubview(square)
//            
//            // randomly create a value between 0.0 and 150.0
//            let randomYOffset = CGFloat( arc4random_uniform(150))
//            
//            // for every y-value on the bezier curve
//            // add our random y offset so that each individual animation
//            // will appear at a different y-position
//            let path = UIBezierPath()
//            path.moveToPoint(CGPoint(x: 16,y: 239 + randomYOffset))
//            path.addCurveToPoint(CGPoint(x: 301, y: 239 + randomYOffset), controlPoint1: CGPoint(x: 136, y: 373 + randomYOffset), controlPoint2: CGPoint(x: 178, y: 110 + randomYOffset))
//            
//            // create the animation
//            let anim = CAKeyframeAnimation(keyPath: "position")
//            anim.path = path.CGPath
//            anim.rotationMode = kCAAnimationRotateAuto
//            anim.repeatCount = Float.infinity
////            anim.duration = 5.0
//            // each square will take between 4.0 and 8.0 seconds
//            // to complete one animation loop
//            anim.duration = Double(arc4random_uniform(40)+30) / 10
//            
//            // stagger each animation by a random value
//            // `290` was chosen simply by experimentation
//            anim.timeOffset = Double(arc4random_uniform(100))
//            
//            // add the animation 
//            square.layer.addAnimation(anim, forKey: "animate position along path")
//        }
        
        
    
    
//        for loopNumber in 0...numberOfFish {
//            let screenSize: CGRect = UIScreen.mainScreen().bounds
//            let screenWidth = screenSize.width
//            let screenHeight = screenSize.height
//            
//            let duration = 1.0
//            let delay = NSTimeInterval(900 + arc4random_uniform(300)) / 1000
//            let options = UIViewAnimationOptions.CurveLinear
//
//            
//            let size : CGFloat = CGFloat( arc4random_uniform(40))+20
//            let yPosition : CGFloat = CGFloat( arc4random_uniform(600))+20
//            
//        
//            let coloredSquare = UIView()
//            coloredSquare.backgroundColor = UIColor.blueColor()
//            coloredSquare.frame = CGRectMake(0 - size, yPosition, size, size)
//            self.view.addSubview(coloredSquare)
//
//        UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
//            
//            // any changes entered in this block will be animated
//            coloredSquare.backgroundColor = UIColor.redColor()
//            coloredSquare.frame = CGRectMake(screenWidth, yPosition, size, size)
//            
//            }, completion: { animationFinished in
//                
//                // when complete, remove the square from the parent view
//                coloredSquare.removeFromSuperview()
//                
//        })
//    }
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

