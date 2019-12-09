//
//  Apartment.swift
//  AptFinder
//
//  Created by Jade Meyer on 11/21/19.
//  Copyright © 2019 Mark Meyer. All rights reserved.
//

import Foundation

class Apartment {
    
    var img: String
    var title: String
    var info: String
    var address: String
    var phone: String
    var email: String
    
    init(img: String, title: String, info: String, address: String, phone: String, email: String) {
        self.img = img
        self.title = title
        self.info = info
        self.address = address
        self.phone = phone
        self.email = email
    }
}
