//
//  MenuItem.swift
//  RestaurantApp
//
//  Created by Brian van de Velde on 03-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

struct MenuItem: Codable
{
    var id: Int
    var name: String
    var detailText: String
    var price: Double
    var category: String
    var imageURL: URL

        enum CodingKeys: String, CodingKey
        {
            case id
            case name
            case detailText = "description"
            case price
            case category
            case imageURL = "image_url"
        }
}

struct MenuItems: Codable
{
    let items: [MenuItem]
}

