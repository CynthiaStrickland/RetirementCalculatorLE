//
//  CountdownViewController.swift
//  Retirement Counter
//
//  Created by Cynthia Whitlatch on 6/5/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {
    
    @IBOutlet weak var dayCounter: UILabel!
    @IBOutlet weak var hourCounter: UILabel!
    @IBOutlet weak var minuteCounter: UILabel!
    @IBOutlet weak var secondCounter: UILabel!
    
    @IBOutlet var countdownLabel: UIView!
    
    var countdownTimer = NSTimer()

    
    //Assigns date chosen on date picker to date
//    let date:NSDate = datePickerDate.date
//    
//    let dateOfRetirement = NSCalendar.currentCalendar()
//    let components = dateOfRetirement.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitDay, fromDate: date)
//    
//    let hour = components.hour
//    let minutes = components.minute
//    let month = components.month
//    let year = components.year
//    let day = components.day
//    
//    func updateCounter() {
//        let timeLeft = datePicker.date.timeIntervalSinceNow
//        countingLabel.text = timeLeft.time
//    }
    
//    func startCountdown() {
//        let timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
//
//        let currentDate = NSDate();
//        let currentFormatter = NSDateFormatter();
//        currentFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//        currentFormatter.timeZone = NSTimeZone(abbreviation: "GMT+2:00")
//        
//÷
//        let countdown = "\(diffDateComponents.month) m: \(diffDateComponents.day) d: \(diffDateComponents.hour) h: \(diffDateComponents.minute) min"
//    }
    
    func updateTime() {
        
    }
    
//    func compareDates() {
//        let retirementDate = NSDateComponents()
//        retirementDate.year = 2015
//        retirementDate.month = 6
//        retirementDate.day = 21
//        retirementDate.hour = 08
//        retirementDate.minute = 00
//        let retirement = retirementCalendar.dateFromComponents(retirementDate)!
//        
//
//    }

    func DateFromString(dateStr:String, format:String="yyyy-MM-dd HH:mm") -> NSDate{
        let dateFmt = NSDateFormatter()
        dateFmt.timeZone = NSTimeZone.defaultTimeZone()
        dateFmt.dateFormat = format
        return dateFmt.dateFromString(dateStr)!
    }
    
    func timeString(time:NSTimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = time - Double(minutes) * 60
        let secondsFraction = seconds - Double(Int(seconds))
        return String(format:"%02i:%02i.%01i",minutes,Int(seconds),Int(secondsFraction * 10.0))
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        startCountdown()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension NSTimeInterval {
    var time:String {
        return String(format:"%02dd %02dh %02dm %02ds", Int((self/86400)), Int((self/3600.0)%24), Int((self/60.0)%60), Int((self)%60))
    }
}