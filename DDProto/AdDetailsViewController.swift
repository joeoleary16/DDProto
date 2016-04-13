//
//  AdDetailsViewController.swift
//  DDProto
//
//  Created by joe on 11/04/2016.
//  Copyright © 2016 Joe O'Leary. All rights reserved.
//

import UIKit
import Alamofire

struct AdDet {
    let id: Int
    let header: String
    let description: String
    let price: String
    let county: String
    let currency: String
    let age: String
    let adDetPhoto: AdDetPhoto?
}

struct AdDetPhoto {
    let id: Int
    let large: String?
}


class AdDetailsViewController: UIViewController {
    
    // MARK: outlets
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var adDescriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var adAge: UILabel!
    
    // MARK: vars, lets and the like
    var adId: Int?
    var adPrice = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchAdDetails()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchAdDetails() {
        if let adId = self.adId {
            let urlString = "https://api.donedeal.ie/adview/api/v3/view/ad/\(adId)"
            print(urlString)
            Alamofire.request(.GET, urlString)
                .responseJSON { response in
                    if let JSON = response.result.value as? [String: AnyObject]{
                        // you should go to the bother of parsing the JSON object and mapping it's values to a model in a seperate method
                        // see line 71 and parseSearchResults in the ViewController.swift file
                        if let header = JSON["header"] as? String,
                            adDescription = JSON["description"] as? String,
                            county = JSON["county"] as? String,
                            price = JSON["price"] as? String,
                            currency = JSON["currency"] as? String,
                            age = JSON["age"] as? String,
                            adId = self.adId {
                                let adModel = AdDet(id: adId, header: header, description: adDescription, price: price, county: county, currency: currency, age: age, adDetPhoto: nil)
                                
                            self.updateUI(adModel)
                        }
                    }
            }
        }
    }
    
    func updateUI(adModel: AdDet) {
        self.headerLabel.text = adModel.header
        self.priceLabel.text = adModel.price
        self.adDescriptionLabel.text = adModel.description
        self.locationLabel.text = adModel.county
        self.adAge.text = adModel.age
        self.priceLabel.text = adModel.price
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
