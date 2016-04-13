//
//  CommonQuestionsViewController.swift
//  DDProto
//
//  Created by joe on 09/04/2016.
//  Copyright © 2016 Joe O'Leary. All rights reserved.
//

import UIKit

class CommonQuestionsViewController: UIViewController {

    @IBOutlet weak var commonQuestionsWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let myURL = NSURL(string: "https://hello.donedeal.ie/hc/en-us/categories/200189592-Common-Questions")
        
        let myURLRequest:NSURLRequest = NSURLRequest(URL: myURL!);
        commonQuestionsWebView.loadRequest(myURLRequest);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
