//
//  AdBrowserViewController.swift
//  DDProto
//
//  Created by joe on 11/04/2016.
//  Copyright © 2016 Joe O'Leary. All rights reserved.
//


import UIKit
import Alamofire

struct Ad {
    let id: Int
    let header: String
    let description: String
    let price: String
    let county: String
    let currency: String
    let age: String
    let adPhoto: AdPhoto?
}

struct AdPhoto {
    let id: Int
    let large: String?
}


class AdBrowserViewController: UIViewController {


    @IBOutlet weak var adBrowserCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!

    
    
    var adModels = [Ad]() // array of ad models that the collection view will use to build up the UI
    var adPrice = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupCellSize()
        setupSearchAccessoryView()
        fetchSearchResultsWithText(searchText: nil)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupCellSize(){
        
        //let width = (CGRectGetWidth(collectionView!.frame) / 3) - 10
        let layout = adBrowserCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 170, height: 200)
    }
    
    func setupSearchAccessoryView(){
        let keyboardToolbar = UIToolbar(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 44))
        let flexi = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "keyboardDoneTapped:")
        keyboardToolbar.items = [flexi, doneButton]
        searchBar.inputAccessoryView = keyboardToolbar
    }
    
    
    func fetchSearchResultsWithText(searchText searchText: String?){
        
        // a new search has been started.  Clear out anything we have saved in the adModels array
        self.adModels.removeAll()
        
        let urlString = "https://api.donedeal.ie/search/api/v3/find/"
        var requestParams: [String: AnyObject] = [
            "start": 0,
            "max": 40,
            "section": "all",
            "startTime": "\(Int64(NSDate().timeIntervalSince1970 * 1000))"   // this creates a timestamp of when the search request was made.  this is needed by the api
        ]
        
        if let searchText = searchText where searchText != "" {
            requestParams["words"] = searchText
        }
        
        Alamofire.request(.POST, urlString, parameters: requestParams, encoding: .JSON)
            .responseJSON { response in
                if let JSON = response.result.value as? [String: AnyObject], ads = JSON["ads"] as? [[String: AnyObject]] {
                    self.parseSearchResults(ads)
                    self.adBrowserCollectionView.reloadData()
                }
        }
    }
    
    func parseSearchResults(searchResults: [[String: AnyObject]]) {
        
        func parsePhotoObject(photosJSON: [[String: AnyObject]]?) -> AdPhoto? {
            if let photosJSON = photosJSON {
                let firstPhoto = photosJSON[0]
                if let id = firstPhoto["id"] as? Int, large = firstPhoto["large"] as? String {
                    let photo = AdPhoto(id: id, large: large)
                    return photo
                }
            }
            return nil
        }
        
        var adModels = [Ad]()
        for result in searchResults {
            if let adid = result["id"] as? Int,
                header = result["header"] as? String,
                price = result["price"] as? String,
                county = result["county"] as? String,
                currency = result["currency"] as? String,
                age = result["age"] as? String,
                adDescription = result["description"] as? String{
                    let photosArray: [[String: AnyObject]]? = result["photos"] as? [[String: AnyObject]]
                    if currency == "EUR" {
                        adPrice = "€" + price
                    }
                    
                    let ad = Ad(id: adid, header: header, description: adDescription, price: adPrice, county: county, currency: currency, age: age, adPhoto: parsePhotoObject(photosArray))
                    adModels.append(ad)
            }
        }
        self.adModels = adModels
    }
    
    func keyboardDoneTapped(sender: AnyObject) {
        searchBar.resignFirstResponder()
    }
    
}


extension AdBrowserViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.adModels.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AdCell", forIndexPath: indexPath) as! AdCell
        cell.tag = indexPath.row
        let adModel = self.adModels[indexPath.row]
        cell.adTitleLabel.text = adModel.header
        cell.adPriceLabel.text = adModel.price
        cell.adLocationLabel.text = adModel.county
        cell.loadImage(adModel.adPhoto?.large, tag: indexPath.row)
        cell.adAgeLabel.text = adModel.age
        //cell.adImageView
        
        return cell
    }
}



extension AdBrowserViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        fetchSearchResultsWithText(searchText: searchBar.text)
        
        // this method is triggered when the search button is pressed
        // the line below will resign the keyboard for you
        searchBar.resignFirstResponder()
    }
}

extension AdBrowserViewController {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "AdDetailsSegue" {
            if let adCell = sender as? AdCell {
                // 1. get the indexPath of the cell
                let indexPath = self.adBrowserCollectionView.indexPathForCell(adCell)
                if let row = indexPath?.row where row < self.adModels.count  {
                    // 2. get the model for the selected cell
                    let adModel = self.adModels[row]
                    
                    // 3. get a reference to the viewController we're moving to
                    let adDetailsViewController = segue.destinationViewController as? AdDetailsViewController
                    
                    // 4. pass in the ad id into the adDetailsViewController
                    adDetailsViewController?.adId = adModel.id
                }
            }
        }
    }
}

