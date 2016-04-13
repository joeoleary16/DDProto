//
//  ADCell.swift
//  DDProto
//
//  Created by joe on 10/02/2016.
//  Copyright © 2016 Joe O'Leary. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class AdCell: UICollectionViewCell {



    @IBOutlet weak var adTitleLabel: UILabel!
    
    @IBOutlet weak var adPriceLabel: UILabel!
    
    @IBOutlet weak var adImageView: UIImageView!
    @IBOutlet weak var adLocationLabel: UILabel!
    @IBOutlet weak var adAgeLabel: UILabel!
    
    override func prepareForReuse() {
        self.adImageView.image = nil
    }
    
    func loadImage(urlString: String?, tag: Int){
        
        if let urlString = urlString where urlString != "" {
            Alamofire.request(.GET, urlString)
                .responseImage(completionHandler: { response in
                    if let image = response.result.value {
                        if tag == self.tag {
                            self.adImageView.image = image
                        }
                    }
                })
        }
    }
}
