//
//  Struct.swift
//  AptFinder
//
//  Created by Jade Meyer on 12/8/19.
//  Copyright © 2019 Mark Meyer. All rights reserved.
//

import Foundation

struct CreateApartment: Encodable {
    let img: String
    let title: String
    let info: String
    let address: String
    let phone: String
    let email: String

    enum CodingKeys: String, CodingKey {
        case img = "img"
        case title = "title"
        case info = "info"
        case address = "address"
        case phone = "phone"
        case email = "email"
    }
}

struct Apartment: Decodable {
    let img: String
    let title: String
    let info: String
    let address: String
    let phone: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case img = "img"
        case title = "title"
        case info = "info"
        case address = "address"
        case phone = "phone"
        case email = "email"
    }
}

struct ApartmentResponse: Decodable {
    let success: Bool
    let data: [Apartment]
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case data = "data"
    }
}

struct Result: Decodable {
    let success: Bool
    enum CodingKeys: String, CodingKey {
        case success = "success"
    }
}
