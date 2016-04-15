//
//  RoundedCornersView.swift
//  DDProto
//
//  Created by Joe O'Leary on 18/02/2016.
//  Copyright © 2015 Joe O'Leary. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCornersView: UIView {
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
      layer.masksToBounds = cornerRadius > 0
    }
  }
}