//
//  DatePickerViewController.swift
//  Retirement Counter
//
//  Created by Cynthia Whitlatch on 6/6/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var setDatePicker: UIDatePicker!
    @IBOutlet weak var setTimePicker: UIDatePicker!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    


    
    let buttonColor = UIColor(red:0/255, green:134/255, blue:239/255, alpha:1.0).CGColor as CGColorRef
    let buttonBorder = UIColor.whiteColor().CGColor
    
    @IBAction func datePickerPressed(sender: AnyObject) {
        datePickerDidChange()
    }
    
    @IBAction func timePickerPressed(sender: AnyObject) {
        datePickerDidChange()
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("date", sender: nil)
        // Use this method unless you're connecting a button to a viewcontroller in storyboard
        
    }

    
    func datePickerDidChange() {
        let dateFormatter = NSDateFormatter()
        let timeFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        timeFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let strDate = dateFormatter.stringFromDate(setDatePicker.date)
        dateLabel.text = strDate
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentDate = NSDate()
        setDatePicker.minimumDate = currentDate
        setDatePicker.addTarget(self, action: Selector("dataPickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)


        customSaveButton()

    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.whiteColor()
        
            //CUSTOM DATEPICKER APPEARANCE
        
        setDatePicker.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        setDatePicker.datePickerMode = .CountDownTimer
        setDatePicker.datePickerMode = .DateAndTime
        
        setTimePicker.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        setTimePicker.datePickerMode = .CountDownTimer
        setTimePicker.datePickerMode = .DateAndTime
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func customSaveButton() {
        saveButton.layer.borderColor = buttonBorder
        saveButton.layer.backgroundColor  = buttonColor
        saveButton.layer.borderWidth = 1
        saveButton.layer.cornerRadius = 10
        
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc2 = segue.destinationViewController as? CountdownViewController
        vc2!.date = sender as! NSDate
    }
}
    
    
//    /***** NSDateFormatter Part *****/
//    
//    let formatter = NSDateFormatter()
//    formatter.dateStyle = NSDateFormatterStyle.LongStyle
//    formatter.timeStyle = .MediumStyle
//    
//    let dateString = formatter.stringFromDate(morningOfChristmas)
//  
//    let morningOfChristmasComponents = NSDateComponents()
//    morningOfChristmasComponents.year = 2016
//    morningOfChristmasComponents.month = 12
//    morningOfChristmasComponents.day = 25
//    morningOfChristmasComponents.hour = 7
//    morningOfChristmasComponents.minute = 0
//    morningOfChristmasComponents.second = 0
//    
//    let morningOfChristmas = NSCalendar.currentCalendar().dateFromComponents(morningOfChristmasComponents)!
//    
//  
//    
//    class VC1:UIViewController {
//        @IBAction func next() {
//            let valueToPass = NSDate() // Could be anything that conforms to AnyObject
//            self.performSegueWithIdentifier("segueID", sender: valueToPass) // Use this method unless you're connecting a button to a viewcontroller in storyboard
//        }

//    
//    
//    class VC2:UIViewController {
//        var date:NSDate! // Property you want to pass to
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
