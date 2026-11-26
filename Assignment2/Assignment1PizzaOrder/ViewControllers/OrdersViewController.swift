//
//  OrdersViewController.swift
//  Assignment1PizzaOrder
//
//  Created by Ryan Franco on 2026-11-11.
//

import UIKit

class OrdersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let mainDeletegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    
    @IBOutlet weak var ordersTableView: UITableView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let order = mainDeletegate.orders[indexPath.row]
        
        var size = "Small"
        
        if order.size == 1 {
            size = "Medium"
            
            
            
            
        }
        
        else if order.size == 2 {
            
            size = "Large"
            
        }
        let message = "Delivery date: \(order.deliveryDate ?? "")\nAddress: \(order.address ?? "")\nSize: \(size)\nMeat toppings: \(order.meatToppings ?? "")\nVegetable toppings: \(order.vegToppings ?? "")\nAvatar: \(order.avatar ?? "")"
        
        let alert = UIAlertController(title: "Pizza order", message: message, preferredStyle: .alert)
        
        
        let canceltheAlert = UIAlertAction(title: "OK", style: .cancel)
        
        alert.addAction(canceltheAlert)
        
        present(alert,animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDeletegate.orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell: OrderCell = tableView.dequeueReusableCell(withIdentifier: "sitecell") as? OrderCell ?? OrderCell(style: .default, reuseIdentifier: "sitecell")
        
        let order = mainDeletegate.orders[indexPath.row]
        
        var size = "Small"
        
        if order.size == 1 {
            size = "Medium"
            
            
            
            
        }
        
        else if order.size == 2 {
            
            size = "Large"
            
        }
        
        
        
        tableCell.primaryLabel.text = size + " Pizza"
        tableCell.secondaryLabel.text = order.address
        
        tableCell.myImageView.image = UIImage(named: order.avatar ?? "pic1")
        
        
        
        
        
        return tableCell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 170
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mainDeletegate.readDataFromDatabase()
        
        ordersTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    
    
}
