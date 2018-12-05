//
//  IntermediaryModels.swift
//  RestaurantApp
//
//  Created by Brian van de Velde on 03-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

struct Categories: Codable
{
    let categories: [String]
}

struct PreparationTime: Codable
{
    let prepTime: Int

    enum CodingKeys: String, CodingKey
    {
        case prepTime = "preparation_time"
    }
}
