//
//  AppDelegate.swift
//  LoginAnimation
//
//  Created by Nareg Khoshafian on 3/29/16.
//  Copyright © 2016 Intrepid. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let frame = UIScreen.mainScreen().bounds
        window = UIWindow(frame: frame)
        window?.makeKeyAndVisible()
        
        setRootViewController(UserProfileViewController())
        
        return true
    }
    
    private func setRootViewController(rootVC: UIViewController) {
        window?.rootViewController = UINavigationController(rootViewController: rootVC)
    }
}
