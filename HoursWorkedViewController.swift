//
//  HoursWorkedViewController.swift
//  Retirement Counter
//
//  Created by Cynthia Whitlatch on 6/9/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class HoursWorkedViewController: UIViewController, UITextFieldDelegate {

    let buttonColor = UIColor(red:82/255, green:181/255, blue:255/255, alpha:1.0).CGColor as CGColorRef
    let buttonBorder = UIColor.whiteColor().CGColor

    @IBOutlet weak var saveHoursWorked: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBAction func saveHoursWorked(sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customSwitch()
        customButtons()
    }
    
    @IBOutlet weak var nineEightySwitch: UISwitch!
    @IBOutlet weak var mondaySwitch: UISwitch!
    @IBOutlet weak var tuesdaySwitch: UISwitch!
    @IBOutlet weak var wednesdaySwitch: UISwitch!
    @IBOutlet weak var thursdaySwitch: UISwitch!
    @IBOutlet weak var fridaySwitch: UISwitch!
    @IBOutlet weak var saturdaySwitch: UISwitch!
    @IBOutlet weak var sundaySwitch: UISwitch!
    @IBOutlet weak var fortyHourSwitch: UISwitch!
    
    
    @IBOutlet weak var nineEightyHoursWorked: UITextField!
    @IBOutlet weak var mondayHoursWorked: UITextField!
    @IBOutlet weak var tuesdayHoursWorked: UITextField!
    @IBOutlet weak var wednesdayHoursWorked: UITextField!
    @IBOutlet weak var thursdayHoursWorked: UITextField!
    @IBOutlet weak var fridayHoursWorked: UITextField!
    @IBOutlet weak var saturdayHoursWorked: UITextField!
    @IBOutlet weak var sundayHoursWorked: UITextField!
    @IBOutlet weak var fortyHoursWorked: UITextField!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        nineEightySwitch.resignFirstResponder()
        mondaySwitch.resignFirstResponder()
        tuesdaySwitch.resignFirstResponder()
        wednesdaySwitch.resignFirstResponder()
        thursdaySwitch.resignFirstResponder()
        fridaySwitch.resignFirstResponder()
        saturdaySwitch.resignFirstResponder()
        sundaySwitch.resignFirstResponder()
        fortyHourSwitch.resignFirstResponder()
        
        
        nineEightyHoursWorked.resignFirstResponder()
        mondayHoursWorked.resignFirstResponder()
        tuesdayHoursWorked.resignFirstResponder()
        wednesdayHoursWorked.resignFirstResponder()
        thursdayHoursWorked.resignFirstResponder()
        fridayHoursWorked.resignFirstResponder()
        saturdayHoursWorked.resignFirstResponder()
        sundayHoursWorked.resignFirstResponder()
        fortyHoursWorked.resignFirstResponder()

    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        nineEightySwitch.resignFirstResponder()
        mondayHoursWorked.resignFirstResponder()
        tuesdayHoursWorked.resignFirstResponder()
        wednesdayHoursWorked.resignFirstResponder()
        thursdayHoursWorked.resignFirstResponder()
        fridayHoursWorked.resignFirstResponder()
        saturdayHoursWorked.resignFirstResponder()
        sundayHoursWorked.resignFirstResponder()
        fortyHourSwitch.resignFirstResponder()


        return true
    }
    
    func customButtons() {
        saveHoursWorked.layer.borderColor = buttonBorder
        saveHoursWorked.layer.backgroundColor  = buttonColor
        saveHoursWorked.layer.borderWidth = 1
        saveHoursWorked.layer.cornerRadius = 10
        
        backButton.layer.borderColor = buttonBorder
        backButton.layer.backgroundColor  = buttonColor
        backButton.layer.borderWidth = 1
        backButton.layer.cornerRadius = 10
        
        
    }
    
    func customSwitch() {
        
        nineEightySwitch.thumbTintColor = UIColor.whiteColor()
        mondaySwitch.thumbTintColor = UIColor.whiteColor()
        tuesdaySwitch.thumbTintColor = UIColor.whiteColor()
        wednesdaySwitch.thumbTintColor = UIColor.whiteColor()
        thursdaySwitch.thumbTintColor = UIColor.whiteColor()
        fridaySwitch.thumbTintColor = UIColor.whiteColor()
        saturdaySwitch.thumbTintColor = UIColor.whiteColor()
        sundaySwitch.thumbTintColor = UIColor.whiteColor()
        fortyHourSwitch.thumbTintColor = UIColor.whiteColor()
        
        nineEightySwitch.onTintColor = UIColor(red:82/255, green:181/255, blue:255/255, alpha:1.0)
        mondaySwitch.onTintColor = UIColor(red:82/255, green:181/255, blue:255/255, alpha:1.0)
        tuesdaySwitch.onTintColor = UIColor(red:82/255, green:181/255, blue:255/255, alpha:1.0)
        wednesdaySwitch.onTintColor = UIColor(red:82/255, green:181/255, blue:255/255, alpha:1.0)
        thursdaySwitch.onTintColor = UIColor(red:82/255, green:181/255, blue:255/255, alpha:1.0)
        fridaySwitch.onTintColor = UIColor(red:82/255, green:181/255, blue:255/255, alpha:1.0)
        saturdaySwitch.onTintColor = UIColor(red:82/255, green:181/255, blue:255/255, alpha:1.0)
        sundaySwitch.onTintColor = UIColor(red:82/255, green:181/255, blue:255/255, alpha:1.0)
        fortyHourSwitch.onTintColor = UIColor(red:82/255, green:181/255, blue:255/255, alpha:1.0)
        

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
