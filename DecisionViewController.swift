//
//  DecisionViewController.swift
//  Retirement Counter
//
//  Created by Cynthia Whitlatch on 6/6/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class DecisionViewController: UIViewController {

    
    @IBOutlet weak var retirementHours: UIButton!
    @IBOutlet weak var retirementDate: UIButton!
    
    let buttonColor = UIColor(red:82/255, green:181/255, blue:255/255, alpha:1.0).CGColor as CGColorRef
    let buttonBorder = UIColor.whiteColor().CGColor
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customButton()
    }
    
    override func viewDidAppear(animated: Bool) {
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.whiteColor()

    }
    
    func customButton() {
        
        retirementHours.layer.borderColor = buttonBorder
        retirementHours.layer.backgroundColor  = buttonColor
        retirementHours.layer.borderWidth = 1
        retirementHours.layer.cornerRadius = 10
        
        retirementDate.layer.borderColor = buttonBorder
        retirementDate.layer.backgroundColor  = buttonColor
        retirementDate.layer.borderWidth = 1
        retirementDate.layer.cornerRadius = 10
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
