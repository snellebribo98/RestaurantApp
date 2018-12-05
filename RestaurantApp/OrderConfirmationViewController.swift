//
//  OrderConfirmationViewController.swift
//  RestaurantApp
//
//  Created by Brian van de Velde on 04-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController
{
    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    var minutes: Int!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        timeRemainingLabel.text = "Thank you for your order! Your wait time is approximately \(minutes!) minutes."
    }
}
