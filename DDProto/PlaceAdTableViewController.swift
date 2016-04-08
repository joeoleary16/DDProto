//
//  PlaceAdTableViewController.swift
//  DDProto
//
//  Created by joe on 28/01/2016.
//  Copyright © 2016 Joe O'Leary. All rights reserved.
//,

import UIKit

class PlaceAdTableViewController: UITableViewController, UITextFieldDelegate, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    @IBAction func showActionSheet(sender: AnyObject) {
        let myActionSheet = UIAlertController(title: "Choose Photo", message: "Select source of photo", preferredStyle: UIAlertControllerStyle.ActionSheet);
        
        let gallerySelectButtonAction = UIAlertAction(title: "Gallery", style: UIAlertActionStyle.Default) {
            (ACTION) in
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(myPickerController, animated: true, completion: nil)
        }
        
        
        let cameraSelectButtonAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default) {
            (ACTION) in
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(myPickerController, animated: true, completion: nil)
        }
        
        
        let cancelButtonAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
            (ACTION) in
            print("Cancel button tapped")
        }
        
        
        
        myActionSheet.addAction(gallerySelectButtonAction);
        myActionSheet.addAction(cameraSelectButtonAction);
        myActionSheet.addAction(cancelButtonAction);
        
        self.presentViewController(myActionSheet, animated: true, completion: nil);
    }
    @IBOutlet weak var uploadPhotos: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var addPhotosButton: UIButton!
    @IBOutlet weak var adDescription: UITextView!
    
    @IBOutlet weak var nearestTownTextView: UITextField!
    
    @IBOutlet weak var countyTextView: UITextField!
    
    var receivedString: String = ""
    var receivedString1: String = ""
    var receivedString2: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nearestTownTextView.text = receivedString
        countyTextView.text = receivedString1
        
       
            let adDescription = UITextView(frame: CGRectMake(0,0,100,100))
            adDescription.layer.cornerRadius = 10
            adDescription.layer.borderColor = UIColor.purpleColor().CGColor
            adDescription.layer.borderWidth = 10
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func uploadButtonTapped(sender: AnyObject) {
        
        //myImageUploadrequest()
        
    }
    
 /*   @IBAction func selectPhotoButtonTapped(sender: AnyObject) {
        
        var myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(myPickerController, animated: true, completion: nil)
        
    }
*/
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
        
    {
        myImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
    

    // MARK: - Table view data source

   
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
