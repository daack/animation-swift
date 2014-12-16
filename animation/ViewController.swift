//
//  ViewController.swift
//  animation
//
//  Created by Matteo Maselli on 23/10/14.
//  Copyright (c) 2014 Matteo Maselli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var gameView: UIView!
    
    var genView: UIView = UIView()
    
    
    var animator: UIDynamicAnimator = UIDynamicAnimator()
    var gravity: UIGravityBehavior = UIGravityBehavior()
    var collide: UICollisionBehavior = UICollisionBehavior()
    
    var SQUARE_SIZE: CGSize = CGSizeMake(40.0, 40.0)
    
    @IBAction func tap(sender: UITapGestureRecognizer) {
        self.drop()
    }
    
    override func viewDidLoad() {
        self.setUpAnimation()
    }
    
    func setUpAnimation() {
        self.animator = UIDynamicAnimator(referenceView: self.gameView)
        collide.translatesReferenceBoundsIntoBoundary = true
        self.animator.addBehavior(self.gravity)
        self.animator.addBehavior(self.collide)
    }
    
    func drop() {
        var square: CGRect = CGRect(origin: self.randomPosition() , size: SQUARE_SIZE)
        let squereView: UIView = UIView(frame: square)
        squereView.backgroundColor = randomColor()
        self.gameView.addSubview(squereView)
        
        gravity.addItem(squereView)
        collide.addItem(squereView)
    }
    
    func randomPosition() -> CGPoint {
        
        let random = arc4random() % UInt32(self.gameView.bounds.size.width / SQUARE_SIZE.width)
        let randomPoint: CGPoint = CGPointMake(CGFloat(random) * SQUARE_SIZE.width, 0)
        
        return randomPoint
    }
    
    func randomColor() -> UIColor {
        var index = arc4random() % 5
        switch index {
            case 1:
                return UIColor.blackColor()
            case 2:
                return UIColor.yellowColor()
            case 3:
                return UIColor.greenColor()
            case 4:
                return UIColor.grayColor()
            case 5:
                return UIColor.redColor()
            default:
                return UIColor.blueColor()
        }
    }
}

