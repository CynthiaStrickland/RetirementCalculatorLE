//
//  CountdownViewController.swift
//  Retirement Counter
//
//  Created by Cynthia Whitlatch on 6/5/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit

//protocol RetirementDelegate : DatePickerViewController {
//    func updateCounter()
//}

class CountdownViewController: UIViewController {
    
    @IBOutlet weak var dayCounter: UILabel!
    @IBOutlet weak var hourCounter: UILabel!
    @IBOutlet weak var minuteCounter: UILabel!
    @IBOutlet weak var secondCounter: UILabel!
    
    @IBOutlet weak var generalDateLabel: UILabel!
    
    @IBOutlet var countdownLabel: UIView!
    
    
    var date : NSDate!
    var countdownTimer = NSTimer()
    let dateOfRetirement = NSCalendar.currentCalendar()
    var timeEnd : NSDate!
    var timeNow = UIDatePicker()
    
    
    func updateView() {
            // Initialize Label
        timeEnd = NSDate(timeIntervalSinceReferenceDate: 1.0)
        setTimeLeft()
        
            // Start timer
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.setTimeLeft), userInfo: nil, repeats: true)
    }
    
    func updateCounter() {

    }
    
    func loadChosenDate() {
        NSUserDefaults.standardUserDefaults().objectForKey("Retire-Date") as? NSDate
        let displayDate = loadChosenDate()
        let chosenDateformatter = NSDateFormatter()
        chosenDateformatter.dateFormat = "MMMM-dd-YYYY"
 //       generalDateLabel.text = chosenDateFormatter.stringFromDate(displayDate)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCounter()
        countdownTimer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: #selector(CountdownViewController.updateCounter), userInfo: nil, repeats: true)

    }
    
    func setTimeLeft() {
        let timeNow = NSDate()
        
        // Only keep counting if timeEnd is bigger than timeNow
        if timeEnd.compare(timeNow) == NSComparisonResult.OrderedDescending {
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components([.Day, .Hour, .Minute, .Second], fromDate: timeNow, toDate: timeEnd, options: [])
            
            var dayText = String(components.day) + "d "
            var hourText = String(components.hour) + "h "
            
            // Hide day and hour if they are zero
            if components.day <= 0 {
                dayText = ""
                if components.hour <= 0 {
                    hourText = ""
                }
            }
            generalDateLabel.text = dayText + hourText + String(components.minute) + "m " + String(components.second) + "s"
            
        } else {
            generalDateLabel.text = "Ended"
        }
    }
}

//
//func updateTime() {
//    
//}
//
//
//func DateFromString(dateStr:String, format:String="yyyy-MM-dd HH:mm") -> NSDate{
//    let dateFmt = NSDateFormatter()
//    dateFmt.timeZone = NSTimeZone.defaultTimeZone()
//    dateFmt.dateFormat = format
//    return dateFmt.dateFromString(dateStr)!
//}
//
//func timeString(time:NSTimeInterval) -> String {
//    let minutes = Int(time) / 60
//    let seconds = time - Double(minutes) * 60
//    let secondsFraction = seconds - Double(Int(seconds))
//    return String(format:"%02i:%02i.%01i",minutes,Int(seconds),Int(secondsFraction * 10.0))
//    
//    
//}
//
//extension NSTimeInterval {
//    var time:String {
//        return String(format:"%02dd %02dh %02dm %02ds", Int((self/86400)), Int((self/3600.0)%24), Int((self/60.0)%60), Int((self)%60))
//    }
//}