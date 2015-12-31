//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Shikhar Dhar on 12/28/15.
//  Copyright © 2015 Shikhar Dhar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalLabel1: UILabel!
    
    @IBOutlet weak var totalLabel2: UILabel!
    
    @IBOutlet weak var totalLabel3: UILabel!
    
    @IBOutlet weak var totalLabel4: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Tip Calculator"
        
        tipLabel.text = "$0.00"
        totalLabel1.text = "$0.00"
        totalLabel2.text = "$0.00"
        totalLabel3.text = "$0.00"
        totalLabel4.text = "$0.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.integerForKey("default_tip_percentage")
        
        tipControl.selectedSegmentIndex = tipValue
        billField.becomeFirstResponder()
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.05, 0.10, 0.15]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = Double(billField.text!)
        if billAmount != nil {
        
            let tip = billAmount! * tipPercentage
            let total = billAmount! + tip
            let total2 = total / 2
            let total3 = total / 3
            let total4 = total / 4
        
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel1.text = String(format: "$%.2f", total)
            totalLabel2.text = String(format: "$%.2f", total2)
            totalLabel3.text = String(format: "$%.2f", total3)
            totalLabel4.text = String(format: "$%.2f", total4)
        }
        else {
            tipLabel.text = String("$0.00")
            totalLabel1.text = String("$0.00")
            totalLabel2.text = String("$0.00")
            totalLabel3.text = String("$0.00")
            totalLabel4.text = String("$0.00")
        }
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    

    
}

