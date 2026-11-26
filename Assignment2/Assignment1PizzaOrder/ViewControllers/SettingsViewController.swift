//  SettingsViewController.swift
//  Assignment1PizzaOrder
//
//  Created by Ryan Franco on 2026-09-27.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBAction func saveTheSettings(sender: UIButton){
        rememberData()
    }
    
    
    @IBOutlet weak var txtBoxEmail: UITextField!
    
    @IBOutlet weak var txtBoxNumber: UITextField!
    
    @IBOutlet weak var txtBoxName: UITextField!
    
    func rememberData(){
        
        let defaulty = UserDefaults.standard
        
        defaulty.set(txtBoxName.text, forKey: "lastName")
        
        defaulty.set(txtBoxNumber.text, forKey: "lastPhone")
        
        defaulty.set(txtBoxEmail.text, forKey: "lastEmail")
        
        defaulty.synchronize()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaulty = UserDefaults.standard
        
        if let name = defaulty.object(forKey: "lastName") as? String{
            txtBoxName.text = name
            
        }
        
        if let phone = defaulty.object(forKey: "lastPhone") as? String {
            txtBoxNumber.text = phone
        }
        
        if let email = defaulty.object( forKey: "lastEmail") as? String{
            txtBoxEmail.text = email
        }
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction
    func unwindToViewController(sender: UIStoryboardSegue){
        
    }
    
    
}
