//
//  Post.swift
//  DDProto
//
//  Created by joe on 04/02/2016.
//  Copyright © 2016 Joe O'Leary. All rights reserved.
//

import Foundation

class Post {
    
    var id:Int = 0
    var title:String = ""
    var seller:String = ""
    var details:String = ""
    var location:String = ""
    var phone:Int = 0
    var price:Int = 0
    
    init(id:Int, title:String, seller:String, details:String, location:String, phone:Int, price:Int) {
        self.id = id
        self.title = title
        self.seller = seller
        self.details = details
        self.location = location
        self.phone = phone
        self.price = price
    }
    
    func toJSON() -> String {
        return ""
    }
}