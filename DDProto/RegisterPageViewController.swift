//
//  RegisterPageViewController.swift
//  DDProto
//
//  Created by joe on 10/02/2016.
//  Copyright © 2016 Joe O'Leary. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
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
    

    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        _ = userEmailTextField.text;
        _ = userPasswordTextField.text;
        _ = repeatPasswordTextField.text;
        
        self.userEmailTextField.resignFirstResponder()
        self.userPasswordTextField.resignFirstResponder()
        self.repeatPasswordTextField.resignFirstResponder()
        
        //Check for empty fields
        
        //if (userEmailTextField.isEmpty || (userPasswordTextField.isEmpty) || (repeatPasswordTextField.isEmpty) {
        
        if userEmailTextField.text == "" || userPasswordTextField.text == "" || repeatPasswordTextField.text == ""
        {
            //Do Something
            displayMyAlertMessage("All fields are required");
            
            return;
            
        }
        
        
        // Check if passwords match
        
    if userPasswordTextField.text != repeatPasswordTextField.text {
    
    displayMyAlertMessage("Passwords must match");
        
        return;
    
    }
        
        //Store Data locally
        /*
        
        NSUserDefaults.standardUserDefaults().setObject(userEmailTextField.text, forKey: "userEmail");
        NSUserDefaults.standardUserDefaults().setObject(userPasswordTextField.text, forKey: "userPassword");
        NSUserDefaults.standardUserDefaults().synchronize(); */
        
        //Store Data
        
        let myUrl = NSURL(string: "http://192.168.33.10:80/userRegister.php");
        let request = NSMutableURLRequest(URL:myUrl!);
        request.HTTPMethod = "POST";
        
        let postString = "email=\(userEmailTextField.text)&password=\(userPasswordTextField.text)";
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            
            }
            
            //var err: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            do {
                if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    let resultValue = json["status"] as? String
                    print("result: \(resultValue)")
                    
                    var isUserRegistered:Bool = false;
                    if(resultValue=="Success") {
                        
                        isUserRegistered = true;
                        
                    }
                    
                    var messageToDisplay:String = json["message"] as! String!;
                    if(!isUserRegistered) {
                        
                        messageToDisplay = json["message"] as! String;
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        
                        let myAlert = UIAlertController(title:"Alert", message:messageToDisplay, preferredStyle: UIAlertControllerStyle.Alert);
                        
                        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default) {
                            
                            action in
                            self.dismissViewControllerAnimated(true, completion:nil)
                            
                        }
                        
                        myAlert.addAction(okAction) ;
                        self.presentViewController(myAlert, animated:true, completion:nil)
                        
                         self.performSegueWithIdentifier("registrationSuccess", sender: self);
                        
                    });
                }
            } catch let err as NSError {
                print(err.code)
            }
            //var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: err) as? NSDictionary
            
            
        
        }

        
        task.resume()
        
        // Display alert message with confirmation
        
        /*
        
        let myAlert = UIAlertController(title:"Alert", message:"Registration successful \n Enjoy DoneDealing!!", preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default) {
            
            action in
            self.dismissViewControllerAnimated(true, completion:nil)
        
        }
        
        myAlert.addAction(okAction) ;
        self.presentViewController(myAlert, animated:true, completion:nil) */

}

func displayMyAlertMessage(userMessage:String) {
    
    let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
    let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
    
    myAlert.addAction(okAction);
    
    self.presentViewController(myAlert, animated: true, completion: nil)
    
}

/*func displayMyAlertMessage(userMessage:String) {
            
            var myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
            
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
            
            myAlert.addAction(okAction);
            
            self.presentViewController(myAlert, animated:true, completion:nil);
*/
                
}
        
