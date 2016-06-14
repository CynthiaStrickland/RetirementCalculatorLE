//
//  DatePickerViewController.swift
//  Retirement Counter
//
//  Created by Cynthia Whitlatch on 6/6/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var currentDate = NSDate()
    var datePicker : UIDatePicker!
    
    let buttonColor = UIColor(red:82/255, green:181/255, blue:255/255, alpha:1.0).CGColor as CGColorRef
    let buttonBorder = UIColor.whiteColor().CGColor
    
    @IBAction func calculateButtonPressed() {
        if dateTextField.text == "" {
            let alertView = UIAlertController(title: "Retirement Date",
                message: "Please select your Retirement Date" as String, preferredStyle:.Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertView.addAction(okAction)
            self.presentViewController(alertView, animated: true, completion: nil)
        } else {
            let myDate = dateTextField.text
            let prefs = NSUserDefaults.standardUserDefaults()
            prefs.setObject(myDate, forKey: "Retire-Date")
            print(myDate)
            
            performSegueWithIdentifier("calculate", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customButtons()
        dateTextField.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.whiteColor()
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        dateTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
            self.customDatePicker(self.dateTextField)
            self.datePicker = UIDatePicker()
            self.datePicker.datePickerMode = .Date
            self.datePicker.backgroundColor = UIColor.whiteColor()
            dateTextField.inputView = datePicker
            let now = NSDate()
            dateTextField.inputView = self.datePicker
            datePicker.minimumDate = now
            datePicker.addTarget(self, action: #selector(DatePickerViewController.datePickerChanged(_:)), forControlEvents: .ValueChanged)
    }
    
    func datePickerChanged(sender: UIDatePicker) {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM/dd/yy hh:mm:ss a"
        formatter.timeZone = NSTimeZone.defaultTimeZone()

        dateTextField.text = formatter.stringFromDate(sender.date)
    }
    
    func customDatePicker(textField: UITextField) {
        UIBarButtonItem.appearance().tintColor = UIColor.blueColor()
        
            // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
            // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: #selector(DatePickerViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    func doneClick() {
        dateTextField.resignFirstResponder()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        dateTextField.resignFirstResponder()
    }


    func customButtons() {
        calculateButton.layer.borderColor = buttonBorder
        calculateButton.layer.backgroundColor  = buttonColor
        calculateButton.layer.borderWidth = 1
        calculateButton.layer.cornerRadius = 10
        
        }
    }
