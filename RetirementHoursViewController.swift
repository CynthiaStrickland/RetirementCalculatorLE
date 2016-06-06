//
//  RetirementHoursViewController.swift
//  Retirement Counter
//
//  Created by Cynthia Whitlatch on 6/6/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class RetirementHoursViewController: UIViewController {

    @IBOutlet weak var retirementHoursSaveButton: UIButton!
    
    let buttonColor = UIColor(red:0/255, green:134/255, blue:239/255, alpha:1.0).CGColor as CGColorRef
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
    
    func customSaveButton() {
        retirementHoursSaveButton.layer.borderColor = buttonBorder
        retirementHoursSaveButton.layer.backgroundColor  = buttonColor
        retirementHoursSaveButton.layer.borderWidth = 1
        retirementHoursSaveButton.layer.cornerRadius = 10
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
