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

    @IBAction func btnNextViewControllerPressed(sender:AnyObject){
        
        var secondViewController = SecondViewController();
        
        self.presentViewController(secondViewController, animated: true) { () -> Void in
            println("second view controller presented")
        }
    }
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
    
    var operandStack = Array<Double>()
    var displayValue:Double {
        get{
       
            return NSNumberFormatter().numberFromString(labelDisplay.text!)!.doubleValue
        }
        set{
            labelDisplay.text = "\(newValue)"
            userIsInTheMiddleOfTypingNumber = false
        }
    }
    @IBAction func btnReturnPressed(sender:UIButton?) {
        userIsInTheMiddleOfTypingNumber = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
        
    }
    
    func performOperation(operation: (Double,Double) -> (Double)){
        
        if (operandStack.count >= 2){
            
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
                
            btnReturnPressed(nil)
        }

    }
    
    func performOperation(operation: (Double) -> (Double)){
        
        if (operandStack.count >= 1){
            
            displayValue = operation(operandStack.removeLast())
            btnReturnPressed(nil)
        }
        
    }
    
    func multiply(op1:Double, op2:Double) -> Double{
        
        return op1 * op2
    }
    
    @IBAction func btnOperatePressed(sender: UIButton) {
        
        if let operation = sender.currentTitle{
            
            if userIsInTheMiddleOfTypingNumber{
                btnReturnPressed(nil)
            }

            switch operation{
           
            case "×":
                //Nice
                performOperation(multiply)
            case "÷":
                //Very nice
                performOperation({ (op1:Double, op2:Double) -> (Double) in
                    return op2/op1
                })
            case "+":
                //Super nice
                performOperation({ (op1, op2)  in op1+op2 })
            case "-":
                //OMG FUCKING NICE
                performOperation({ $1 - $0})
   //game over   performOperation {$1 - $0}
                case "√":
                    performOperation { sqrt($0) }
                


            
            default: break
            }
        }
        
    }

    
    override func viewDidLoad() {
        
        
        print(labelDisplay.text);
    }
    
  
}

