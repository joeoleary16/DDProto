//
//  MessageCell.swift
//  DDProto
//
//  Created by joe on 07/04/2016.
//  Copyright © 2016 Joe O'Leary. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class MessageCell: UITableViewCell {
    

    @IBOutlet weak var adImageView: UIImageView!
    
    @IBOutlet weak var donedealerNameLabel: UILabel!

    @IBOutlet weak var adTitleLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
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