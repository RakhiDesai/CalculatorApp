//
//  ViewController.swift
//  Calculator
//
//  Created by Rakhi Desai on 3/24/15.
//  Copyright (c) 2015 Appfish. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    
    @IBOutlet var display: UILabel!
    
    
    var userTypingANumber: Bool = false
    var brain = CalculatorBrain()

       @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        if userTypingANumber {
             display.text = display.text! + digit
        } else {
            display.text = digit
            userTypingANumber = true
        }
       
    }
    @IBAction func operate(sender: UIButton) {
        if userTypingANumber {
            equal()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation){
                displayValue = result
            } else {
                displayValue = 0
            }
        }

    }

@IBAction func equal() {
         userTypingANumber = false
    if let result = brain.pushOperand(displayValue){
        displayValue = result
    } else {
        displayValue = 0
    }
           }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
         display.text = "\(newValue)"
            userTypingANumber = false
        }
    }

}

