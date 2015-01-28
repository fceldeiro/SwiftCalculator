//
//  SecondViewController.swift
//  SwiftCalculator
//
//  Created by Fabian Celdeiro on 1/27/15.
//  Copyright (c) 2015 Fabian Celdeiro. All rights reserved.
//

import UIKit


extension SecondViewController{
    func pepito(pepito:String, parametro2:String){
        
    }
}
    


class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        self.view.backgroundColor = UIColor.redColor();
        
        var rect:CGRect = CGRectMake(0, 0, 120, 120);
        
        var customView = UIView();
        customView.backgroundColor = UIColor.blueColor();
        
        customView.frame = rect;
        
        view.addSubview(customView);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func functionQueRecibeDosEnterosYEscupeUnString(enteroUno:Int,entero2:Int) -> (String){
        
        return "\(enteroUno)" + "\(entero2)";
        
    }
    
    
    func functionQueDevuelve2Valores()  -> (Int,Int,OptionalValue:String?) {
        return (25,8,nil);
    }
    
    func functionQueDevuelveFunction() -> (Int,Int) -> (String){
        
        return functionQueRecibeDosEnterosYEscupeUnString;
    }
    
    override func viewDidAppear(animated: Bool) ->Void {
        super.viewDidAppear(animated);
        
        let   myDispatchTime:dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, (Int64)(10 * NSEC_PER_SEC))
        
        
        var myFunc = self.functionQueDevuelveFunction();
        println(myFunc(25, 48));
        
        var myString:String  = "\(self)";
        myString += "Sarasa"
        println(myString)
        
        println(functionQueDevuelve2Valores().0);
        println(functionQueDevuelve2Valores().OptionalValue);
        

        
        
//        dispatch_after(myDispatchTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
//            self.dismissViewControllerAnimated(true , completion: { () -> Void in
//                println("dismissing view controller \(self) " + "tu vieja" + "\(2)")
//            })
//        }
        

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
