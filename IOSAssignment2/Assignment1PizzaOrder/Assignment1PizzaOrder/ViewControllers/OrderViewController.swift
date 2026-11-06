//
//  OrderViewController.swift
//  Assignment1PizzaOrder
//
//  Created by Ryan Franco on 2026-09-27.
//

import UIKit

class OrderViewController: UIViewController {


  
    @IBOutlet weak var deliveryDatePicker: UIDatePicker!
    
    @IBOutlet weak var txtBoxDeliveryAddress: UITextField!
    
    @IBOutlet weak var chesseSwitch: UISwitch!
    
    @IBOutlet weak var pizzaSize: UISegmentedControl!
    
    @IBOutlet weak var olivesSwitch: UISwitch!
    
    @IBOutlet weak var pepperoniSwitch: UISwitch!
    
    @IBOutlet weak var pineappleSwitch: UISwitch!
    
    
    
    
    
    @IBAction
    func submitButton(sender: UIButton){
        
        var size = "Small"
        
        if pizzaSize.selectedSegmentIndex == 1 {
            size = "Medium"
           
        }else if pizzaSize.selectedSegmentIndex == 2 {
            size = "Large"
        }
        
        
        
        
        
        
        
        
        let alertSubmit = UIAlertController(title: "Order is submitted", message: "Thank you, a \(size) will be delivered to \(txtBoxDeliveryAddress.text!) shortly", preferredStyle: .alert)
        
        
        let cancelAlert = UIAlertAction(title: "Ok", style: .cancel)
        alertSubmit.addAction(cancelAlert)
        present(alertSubmit, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    

}
