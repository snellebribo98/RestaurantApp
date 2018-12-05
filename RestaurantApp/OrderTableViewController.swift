//
//  OrderTableViewController.swift
//  RestaurantApp
//
//  Created by Brian van de Velde on 03-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

class OrderTableViewController: UITableViewController
{
    
    var orderMinutes = 0
    
    @IBAction func unwindToOrderList(segue: UIStoryboardSegue)
    {
        if segue.identifier == "DismissConfirmation"
        {
            MenuController.shared.order.menuItems.removeAll()
        }
    }
    
    @IBAction func submitTapped(_ sender: Any)
    {
        let orderTotal = MenuController.shared.order.menuItems.reduce(0.0)
        { (result, menuItem) -> Double in
            return result + menuItem.price
        }
        
    let formattedOrder = String(format: "$%.2f", orderTotal)
    
    let alert = UIAlertController(title: "Confirm Order", message: "You are about to submit your order with a total of \(formattedOrder)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Submit", style: .default)
        { action in
            self.uploadOrder()
        })
        alert.addAction(UIAlertAction(title: "Cancel",
        style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func uploadOrder()
    {
        let menuIds = MenuController.shared.order.menuItems.map
            { $0.id }
        MenuController.shared.submitOrder(forMenuIDs: menuIds)
    { (minutes) in
            DispatchQueue.main.async
                {
                if let minutes = minutes
                {
                    self.orderMinutes = minutes
                    self.performSegue(withIdentifier:
                    "ConfirmationSegue", sender: nil)
                }
            }
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        NotificationCenter.default.addObserver(tableView, selector: #selector(UITableView.reloadData), name: MenuController.orderUpdatedNotification, object: nil)
    }

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return MenuController.shared.order.menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCellIdentifier", for: indexPath)
        configure(cell, forItemAt: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            MenuController.shared.order.menuItems.remove(at:
            indexPath.row)
        }
    }
    
    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath)
    {
        let menuItem = MenuController.shared.order.menuItems[indexPath.row]
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = String(format: "$%.2f", menuItem.price)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "ConfirmationSegue"
        {
            let orderConfirmationViewController = segue.destination
            as! OrderConfirmationViewController
            orderConfirmationViewController.minutes = orderMinutes
        }
    }

}
