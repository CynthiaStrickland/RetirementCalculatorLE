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
    
    func timeBetween(startDate: NSDate, endDate: NSDate) -> [Int] {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day, .Month, .Year], fromDate: startDate, toDate: endDate, options: [])
        return [components.month, components.day, components.year]
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
        formatter.dateFormat = "MMMM-dd-YYYY"
        dateTextField.text = formatter.stringFromDate(sender.date)
       
            //SAVE DATE TO USER DEFAULTS
        let myDate = dateTextField.text
        NSUserDefaults.standardUserDefaults().setObject(myDate, forKey: "Retire-Date")
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
