//
//  UserProfileViewController.swift
//  LoginAnimation
//
//  Created by Nareg Khoshafian on 3/29/16.
//  Copyright © 2016 Intrepid. All rights reserved.
//


import UIKit

var loggedIn = false

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var hamburgerMenuButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if !loggedIn {
            self.presentViewController(LogInViewController(), animated: false, completion: nil)
        }
    }
    
    private func setup() {
        
        hamburgerMenuButton.transform = CGAffineTransformMakeScale(2, 2)
        animationView.frame.size.height = UIScreen.mainScreen().bounds.height
        
        UIView.animateWithDuration(2.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 4, options: .CurveEaseOut, animations: {
            
            self.hamburgerMenuButton.transform = CGAffineTransformMakeScale(1, 1)
            self.animationView.frame.size.height = 10
            
            }, completion: nil)
    }
    
    @IBAction func logOutButtonPressed(sender: AnyObject) {
        self.presentViewController(LogInViewController(), animated: true, completion: nil)
    }
}
