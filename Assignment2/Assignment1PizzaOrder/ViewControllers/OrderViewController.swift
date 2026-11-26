//
//  OrderViewController.swift
//  Assignment1PizzaOrder
//
//  Created by Ryan Franco on 2026-09-27.
//

import UIKit

class OrderViewController: UIViewController {
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var deliveryDatePicker: UIDatePicker!
    
    @IBOutlet weak var txtBoxDeliveryAddress: UITextField!
    
    @IBOutlet weak var chesseSwitch: UISwitch!
    
    @IBOutlet weak var pizzaSize: UISegmentedControl!
    
    @IBOutlet weak var olivesSwitch: UISwitch!
    
    @IBOutlet weak var pepperoniSwitch: UISwitch!
    
    @IBOutlet weak var pineappleSwitch: UISwitch!
    
    @IBOutlet weak var avatarSegment: UISegmentedControl!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    
    
    
    
    
    
    
    @IBAction func avatarChanged(_ sender: UISegmentedControl) {
        
        
        
        
        
        if avatarSegment.selectedSegmentIndex == 0
        {
            
            avatarImageView.image = UIImage(named: "pic1")
        }
        else if
            
            avatarSegment.selectedSegmentIndex == 1
        {
            avatarImageView.image = UIImage(named:  "pic2")
            
        }
        
        else
        
        {
            avatarImageView.image = UIImage(named: "pic3")
            
        }
        
        
        
    }
    
    
    
    @IBAction
    func submitButton(sender: UIButton){
        
        let deliveryDate = deliveryDatePicker.date.description
        
        var meatToppings = ""
        
        var vegToppings = ""
        
        if pepperoniSwitch.isOn{
            meatToppings = "Pepperoni"
            
        }
        
        if chesseSwitch.isOn{
            meatToppings = meatToppings + "   Cheese"
            
        }
        if olivesSwitch.isOn{
            
            vegToppings = "Olives"
        }
        
        if pineappleSwitch.isOn{
            
            vegToppings = vegToppings + "  Pineapple"
            
        }
        
        var avatar = "pic1"
        
        if avatarSegment.selectedSegmentIndex == 1{
            avatar = "pic2"
            
            
        }
        
        else if avatarSegment.selectedSegmentIndex == 2{
            avatar = "pic3"
        }
        
        
        
        var size = "Small"
        
        if pizzaSize.selectedSegmentIndex == 1 {
            size = "Medium"
            
        }
        else if pizzaSize.selectedSegmentIndex == 2 {
            size = "Large"
        }
        
        
        let order : OrderData = .init()
        
        order.initWithData(theRow: 0, theDate: deliveryDate, theAddress: txtBoxDeliveryAddress.text!, size: pizzaSize.selectedSegmentIndex, theMeat: meatToppings, theVeg: vegToppings, theAvatar: avatar)
        
        let returnCode : Bool = mainDelegate.insertIntoDatabase(order: order)
        var returnMessage = "Thank you, a \(size) will be delivered to \(txtBoxDeliveryAddress.text!) shortly"
        
        if returnCode == false{
            returnMessage = "order cant be inserted into the database!"
        }
        
        
        
        let alertSubmit = UIAlertController(title: "Order is submitted", message: returnMessage, preferredStyle: .alert)
        
        
        let cancelAlert = UIAlertAction(title: "Ok", style: .cancel)
        alertSubmit.addAction(cancelAlert)
        present(alertSubmit, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImageView.image = UIImage(named: "pic1")
        
    }
    
    
    
    
    
}
