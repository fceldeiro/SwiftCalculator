//
//  SecondViewController.swift
//  SwiftCalculator
//
//  Created by Fabian Celdeiro on 1/27/15.
//  Copyright (c) 2015 Fabian Celdeiro. All rights reserved.
//

import UIKit

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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
        let   myDispatchTime:dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, (Int64)(10 * NSEC_PER_SEC))
        
        dispatch_after(myDispatchTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            self.dismissViewControllerAnimated(true , completion: { () -> Void in
                println("dismissing view controller \(self)")
            })
        }
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
