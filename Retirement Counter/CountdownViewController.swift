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
    
    let dateComponents : NSCalendarUnit = [
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
        
        let chosenRetirementDate = loadChosenDate()
        print(chosenRetirementDate)
        
        formatter.dateFormat = "MM/dd/yy hh:mm:ss a"
        let startTime = NSDate()
 //       let endTime = formatter.dateFromString("\(chosenRetirementDate)")
        let endTime = formatter.dateFromString("04/01/18 12:00:00 a")
        
        let countdownTime = dateOfRetirementCalendar.components(dateComponents, fromDate: endTime!, toDate: startTime, options: [])
        countdownLabel.adjustsFontSizeToFitWidth = true
        countdownLabel.text = "\(countdownTime.month) Mo.s \(countdownTime.day) Days \(countdownTime.hour) Hrs \(countdownTime.minute) Min \(countdownTime.second) Sec"
    
    }
    
    func loadChosenDate() -> NSDate {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM/dd/yy hh:mm:ss a"
//        formatter.stringFromDate()
        
        return (NSUserDefaults.standardUserDefaults().stringForKey("Retire-Date"))! as! NSDate
        
    }
    

    
}


