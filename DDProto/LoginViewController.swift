//
//  LoginViewController.swift
//  DDProto
//
//  Created by joe on 10/02/2016.
//  Copyright © 2016 Joe O'Leary. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        
        self.userEmailTextField.resignFirstResponder()
        self.userPasswordTextField.resignFirstResponder()
        
        if userEmail == "" || userPassword == ""
        {
            displayMyAlertMessage("All fields are required");
            return;
        }
        
        let myUrl = NSURL(string: "http://192.168.33.10:80/userLogin.php");
        let request = NSMutableURLRequest(URL: myUrl!);
        request.HTTPMethod = "POST";
        
        let postString = "email=\(userEmail)&password=\(userPassword)";
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return;
            }
            
            do {
                if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    let resultValue = json["status"] as? String
                    
                    print("result: \(resultValue)")
                    
                    var isUserRegistered:Bool = false;
                    if(resultValue=="Success") {
                        
                        isUserRegistered = true;
                        
                    } else {
                        self.displayMyAlertMessage("User is not registered.")
                        return;
                    }
                    
                    var messageToDisplay:String = json["message"] as! String!;
                    if(!isUserRegistered) {
                        
                        messageToDisplay = json["message"] as! String;
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        
                        /*let myAlert = UIAlertController(title:"Alert", message:messageToDisplay, preferredStyle: UIAlertControllerStyle.Alert);
                        
                        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default) {
                            
                            action in
                            self.dismissViewControllerAnimated(true, completion:nil)
                            
                        }
                        
                        myAlert.addAction(okAction) ;
                        self.presentViewController(myAlert, animated:true, completion:nil)*/
                        
                        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn");
                        NSUserDefaults.standardUserDefaults().synchronize();
                        self.dismissViewControllerAnimated(true, completion: nil)
                        
                    });
                }
            } catch let err as NSError {
                print(err.code)
            }
            
            
        }
        
        task.resume();
        
        
        
        /*let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail");
        
        let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword")
        
        if (userEmailStored == userEmail) {
            
            if (userPasswordStored == userPassword)
            
            {
                // Login successful
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn");
                NSUserDefaults.standardUserDefaults().synchronize();
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
        
        if (userPasswordStored != userPassword) {
            
            displayMyAlertMessage("Username or Password incorrect");
            
            return;
            
        }*/
        
        
    }
        
        func displayMyAlertMessage(userMessage:String) {
            
            let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
            
            myAlert.addAction(okAction);
            
            self.presentViewController(myAlert, animated: true, completion: nil)
            
        }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "loginIdentifier" {
            let secondVC: MyDoneDealViewController = segue.destinationViewController as! MyDoneDealViewController
            
            secondVC.receivedString = userEmailTextField.text!
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
