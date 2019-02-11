//
//  ProductInfo.swift
//  JSONImage-Products-JacquelineSchlinger
//
//  Created by Jackie Schlinger on 11/30/18.
//  Copyright © 2018 Jacqueline Schlinger. All rights reserved.
//

import Foundation

struct ProductInfo: Decodable {
    let ProductId: String
    let Name: String
    let Category: String
    let Description: String
    let ProductPicUrl: String
}

