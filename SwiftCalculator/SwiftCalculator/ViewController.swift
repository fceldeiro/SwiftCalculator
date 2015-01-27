//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by Fabian Celdeiro on 1/26/15.
//  Copyright (c) 2015 Fabian Celdeiro. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var userIsInTheMiddleOfTypingNumber : Bool  = false;
    
    @IBOutlet weak var labelDisplay:UILabel!;

    @IBAction func btnDigitPressed(sender:UIButton)-> Void{
        let digit:NSString = sender.currentTitle!
        if (userIsInTheMiddleOfTypingNumber){
            labelDisplay.text = labelDisplay.text! + digit;
        }
        else{
            labelDisplay.text = digit;
            userIsInTheMiddleOfTypingNumber = true;
        }
        
        println("digit = \(digit)")
    }
    
    override func viewDidLoad() {
        
        
        print(labelDisplay.text);
    }
  
}

