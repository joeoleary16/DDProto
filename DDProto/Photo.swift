//
//  Photo.swift
//  DDProto
//
//  Created by Joe O'Leary on 18/02/2016.
//  Copyright © 2015 Joe O'Leary. All rights reserved.
//

import UIKit

class Photo {
  
  class func allPhotos() -> [Photo] {
    var photos = [Photo]()
    if let URL = NSBundle.mainBundle().URLForResource("Photos", withExtension: "plist") {
      if let photosFromPlist = NSArray(contentsOfURL: URL) {
        for dictionary in photosFromPlist {
          let photo = Photo(dictionary: dictionary as! NSDictionary)
          photos.append(photo)
        }
      }
    }
    return photos
  }
  
  var adTitle: String
  var adDetails: String
  var price: String
  var location: String
  var image: UIImage
  
    init(adTitle: String, adDetails: String, price: String, location: String, image: UIImage) {
    self.adTitle = adTitle
    self.adDetails = adDetails
    self.price = price
    self.location = location
    self.image = image
  }
  
  convenience init(dictionary: NSDictionary) {
    let adTitle = dictionary["Ad Title"] as? String
    let adDetails = dictionary["Ad Details"] as? String
    let price = dictionary["Price"] as? String
    let location = dictionary["Location"] as? String
    let photo = dictionary["Photo"] as? String
    let image = UIImage(named: photo!)?.decompressedImage
    self.init(adTitle: adTitle!, adDetails: adDetails!, price: price!, location: location!, image: image!)
  }

  func heightForComment(font: UIFont, width: CGFloat) -> CGFloat {
    let rect = NSString(string: adTitle).boundingRectWithSize(CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
    return ceil(rect.height)
  }

}
