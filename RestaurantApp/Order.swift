//
//  Order.swift
//  RestaurantApp
//
//  Created by Brian van de Velde on 03-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

struct Order: Codable
{
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = [])
    {
        self.menuItems = menuItems
    }
}
