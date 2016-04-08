//
//  AnnotatedPhotoCell.swift
//  DDProto
//
//  Created by Joe O'Leary on 18/02/2016.
//  Copyright © 2015 Joe O'Leary. All rights reserved.
//

import UIKit

class AnnotatedPhotoCell: UICollectionViewCell {
  
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var imageViewHeightLayoutConstraint: NSLayoutConstraint!
  @IBOutlet private weak var adTitleLabel: UILabel!
  @IBOutlet private weak var priceLabel: UILabel!
  @IBOutlet private weak var locationLabel: UILabel!
  
  var photo: Photo? {
    didSet {
      if let photo = photo {
        imageView.image = photo.image
        adTitleLabel.text = photo.adTitle
        priceLabel.text = photo.price
        locationLabel.text = photo.location
      }
    }
  }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        let attributes = layoutAttributes as! AdListLayoutAttributes
        imageViewHeightLayoutConstraint.constant = attributes.photoHeight
    }
  
}
