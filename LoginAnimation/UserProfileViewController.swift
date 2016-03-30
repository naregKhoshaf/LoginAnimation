//
//  UserProfileViewController.swift
//  LoginAnimation
//
//  Created by Nareg Khoshafian on 3/29/16.
//  Copyright © 2016 Intrepid. All rights reserved.
//


import UIKit
import Charts

var loggedIn = false

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var hamburgerMenuButton: UIButton!
    
    var days: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoadSetup()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        viewWIllAppearSetup()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if !loggedIn {
            self.presentViewController(LogInViewController(), animated: false, completion: nil)
        }
        barChartView.animate(yAxisDuration: 2.2, easingOption: .EaseOutQuart)
    }
    
    private func viewDidLoadSetup() {
        days = ["M", "T", "W", "T", "F", "S", "S"]
        let unitsSold = [1.0, 0.0, 0.0, 3.0, 2.0, 0.0, 0.0]
        setChart(days, values: unitsSold)
    }
    
    private func viewWIllAppearSetup() {
        
        hamburgerMenuButton.transform = CGAffineTransformMakeScale(1.5, 1.5)
        animationView.frame.size.height = UIScreen.mainScreen().bounds.height
        searchButton.alpha = 0
        
        UIView.animateWithDuration(2.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 4, options: .CurveEaseOut, animations: {
            
            self.searchButton.alpha = 1
            self.hamburgerMenuButton.transform = CGAffineTransformMakeScale(1, 1)
            self.animationView.frame.size.height = 10
            
            }, completion: nil)
    }
    
    private func setChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [BarChartDataEntry] = []

        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "")
        let chartData = BarChartData(xVals: days, dataSet: chartDataSet)
        
        chartDataSet.colors = [UIColor(red: 0, green: 164/255, blue: 0, alpha: 1)]
        barChartView.data = chartData
        barChartView.noDataText = "No Data"
        barChartView.descriptionText = ""
    }
    
    @IBAction func logOutButtonPressed(sender: AnyObject) {
        self.presentViewController(LogInViewController(), animated: true, completion: nil)
    }
}
