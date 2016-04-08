//
//  ViewController.swift
//  DDProto
//
//  Created by Joe O'Leary on 18/11/2015.
//  Copyright © 2015 Joe O'Leary. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIImagePickerControllerDelegate, UIPickerViewDataSource, UINavigationControllerDelegate {
    
    @IBOutlet weak var takePhotoButton: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var locationText: UITextField!
    
    private var tags: [String]?
    private var colors: [PhotoColor]?

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        super.touchesBegan(touches,withEvent: event)
    }
    // Upload Image Button

    
    @IBAction func uploadButtonTapped(sender: AnyObject) {
        
        //myImageUploadrequest()
    
    }
    

    
    
    
func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])         
    {
        myImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.dismissViewControllerAnimated(true, completion: nil)
    
    }
    
        
    // Ad Title
    @IBOutlet weak var adTitleTextField: UITextField!
    
    // Ad Description
    @IBOutlet weak var adDescriptionTextField: UITextField!
    
    // Ad Price
    @IBOutlet weak var adPriceTextField: UITextField!
    
    // Phone Number
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    
    // Location
    @IBOutlet weak var locationPicker: UIPickerView!
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    var counties:NSArray = []
    var picker = UIPickerView()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        locationText.inputView = picker
        
        // Do any additional setup after loading the view, typically from a nib.
        
 
        
        
        counties = ["Antrim","Armagh","Carlow","Cavan","Clare","Cork","Derry","Donegal","Down","Dublin","Fermanagh","Galway","Kerry","Kildare","Kilkenny","Laois","Leitrim","Limerick","Longford","Louth","Mayo","Meath","Monaghan","Offaly","Roscommon","Sligo","Tipperary","Tyrone","Waterford","Westmeath","Wexford","Wicklow"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return counties.count
    }
    
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "\(counties[row])"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        locationText.text = counties[row] as? String
        
    }
    
    
    
    @IBAction func showActionSheetButtonTapped(sender: AnyObject) {
        
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

}

// Networking calls
extension ViewController {
    func uploadImage(image: UIImage, progress: (percent: Float) -> Void,
        completion: (tags: [String], colors: [PhotoColor]) -> Void) {
            guard let imageData = UIImageJPEGRepresentation(image, 0.5) else {
                print("Could not get JPEG representation of UIImage")
                return
                
            }
    }
}

