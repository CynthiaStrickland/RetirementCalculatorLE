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
    
    let dateText = ""
    var datePicker : UIDatePicker!
    
    let buttonColor = UIColor(red:0/255, green:134/255, blue:239/255, alpha:1.0).CGColor as CGColorRef
    let buttonBorder = UIColor.whiteColor().CGColor
    
    @IBAction func enterButtonPressed(sender: AnyObject) {
        
    }

    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        dateTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
            self.customDatePicker(self.dateTextField)
            let datePicker = UIDatePicker()
        
            dateTextField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(DatePickerViewController.datePickerChanged(_:)), forControlEvents: .ValueChanged)
    }
    
    func datePickerChanged(sender: UIDatePicker) {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM-dd-YYYY"
        dateTextField.text = formatter.stringFromDate(sender.date)
    }
    
    func customDatePicker(textField: UITextField) {
        UIBarButtonItem.appearance().tintColor = UIColor.blueColor()
        let now = NSDate()
        
            // DatePicker
        self.datePicker = UIDatePicker(frame:CGRectMake(0, 0, self.view.frame.size.width, 216))
        self.datePicker.backgroundColor = UIColor.whiteColor()
            //WANT DATEPICKER TO SHOW MONTH, DAY, YEAR
        self.datePicker.datePickerMode = .Date
        

        dateTextField.inputView = self.datePicker
            //WANT MINIMUM DATE SHOWING TO BE TODAY
        datePicker.minimumDate = now
        

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
        let dateFormatter1 = NSDateFormatter()
        dateFormatter1.dateStyle = .ShortStyle
        dateTextField.text = dateFormatter1.stringFromDate(datePicker.date)
        dateTextField.resignFirstResponder()
    }
    
    func cancelClick() {
        dateTextField.resignFirstResponder()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        dateTextField.resignFirstResponder()
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func customButtons() {
        calculateButton.layer.borderColor = buttonBorder
        calculateButton.layer.backgroundColor  = buttonColor
        calculateButton.layer.borderWidth = 1
        calculateButton.layer.cornerRadius = 10
        
        
        
        }
    
    // Date comparision to compare current date and end date.
//    var dateComparisionResult:NSComparisonResult = NSDate().compare(endDate)
//    
//    if dateComparisionResult == NSComparisonResult.OrderedAscending
//    {
//    // Current date is smaller than end date.
//    }
//    else if dateComparisionResult == NSComparisonResult.OrderedDescending
//    {
//    // Current date is greater than end date.
//    }
//    else if dateComparisionResult == NSComparisonResult.OrderedSame
//    {
//    // Current date and end date are same.
//    }
    
    }
