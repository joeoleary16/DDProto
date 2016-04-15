//
//  MyDoneDealViewController.swift
//  DDProto
//
//  Created by joe on 10/02/2016.
//  Copyright © 2016 Joe O'Leary. All rights reserved.
//

import UIKit

class MyDoneDealViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    var receivedString: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailLabel.text = receivedString

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn");
        
        if (!isUserLoggedIn) {
            self.performSegueWithIdentifier("logoutView", sender: self)
        
        }
       
    }
    

    @IBAction func logoutButtonTapped(sender: AnyObject) {
        
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn");
        NSUserDefaults.standardUserDefaults().synchronize();
        
        self.performSegueWithIdentifier("logoutView", sender: self);
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
