//
//  RetirementHoursViewController.swift
//  Retirement Counter
//
//  Created by Cynthia Whitlatch on 6/6/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class RetirementHoursViewController: UIViewController {

    @IBOutlet weak var workHours: UIButton!
    @IBOutlet weak var retirementHoursSaveButton: UIButton!
    @IBOutlet weak var OTHours: UITextField!
    @IBOutlet weak var hoursAlreadyWorked: UITextField!
    @IBOutlet weak var hoursRequiredTextField: UITextField!
    
    let buttonColor = UIColor(red:82/255, green:181/255, blue:255/255, alpha:1.0).CGColor as CGColorRef
    let buttonBorder = UIColor.whiteColor().CGColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customSaveButton()
    }
    
    override func viewDidAppear(animated: Bool) {
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.whiteColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        OTHours.resignFirstResponder()
        hoursAlreadyWorked.resignFirstResponder()
        hoursRequiredTextField.resignFirstResponder()
    }
    
    func customSaveButton() {
        retirementHoursSaveButton.layer.borderColor = buttonBorder
        retirementHoursSaveButton.layer.backgroundColor  = buttonColor
        retirementHoursSaveButton.layer.borderWidth = 1
        retirementHoursSaveButton.layer.cornerRadius = 10
        
        workHours.layer.borderColor = buttonBorder
        workHours.layer.backgroundColor  = buttonColor
        workHours.layer.borderWidth = 1
        workHours.layer.cornerRadius = 10
        
        OTHours.layer.borderColor = buttonBorder
        OTHours.layer.backgroundColor  = buttonColor
        OTHours.layer.borderWidth = 1
        OTHours.layer.cornerRadius = 10
        
        hoursAlreadyWorked.layer.borderColor = buttonBorder
        hoursAlreadyWorked.layer.backgroundColor  = buttonColor
        hoursAlreadyWorked.layer.borderWidth = 1
        hoursAlreadyWorked.layer.cornerRadius = 10
        
        hoursRequiredTextField.layer.borderColor = buttonBorder
        hoursRequiredTextField.layer.backgroundColor  = buttonColor
        hoursRequiredTextField.layer.borderWidth = 1
        hoursRequiredTextField.layer.cornerRadius = 10
    }

}
