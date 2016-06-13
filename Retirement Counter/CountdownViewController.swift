//
//  CountdownViewController.swift
//  Retirement Counter
//
//  Created by Cynthia Whitlatch on 6/5/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {

    @IBOutlet weak var countdownLabel: UILabel!
    
    var formatter = NSDateFormatter()
    let dateOfRetirementCalendar = NSCalendar.currentCalendar()
    
    let retirementDateComponents : NSCalendarUnit = [
        NSCalendarUnit.Month,
        NSCalendarUnit.Day,
        NSCalendarUnit.Hour,
        NSCalendarUnit.Minute,
        NSCalendarUnit.Second
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(updateView), userInfo: nil, repeats: true)
        timer.fire()
        

    }
    
    func updateView() {
        formatter.dateFormat = "MM/dd/yy hh:mm:ss a"
        let startTime = NSDate()
 //       let endTime = formatter.dateFromString("\(myDate")
        let endTime = formatter.dateFromString("01/01/2016 12:00:00 a")

        let countdownTime = dateOfRetirementCalendar.components(retirementDateComponents, fromDate: endTime!, toDate: startTime, options: [])
        countdownLabel.text = "\(countdownTime.month) Months \(countdownTime.day) Days \(countdownTime.hour) Hours \(countdownTime.minute) Minutes \(countdownTime.second) Seconds"
        

    }
    
    func loadChosenDate() {
        NSUserDefaults.standardUserDefaults().objectForKey("Retire-Date") as? NSDate
        
    }
    

    
}


