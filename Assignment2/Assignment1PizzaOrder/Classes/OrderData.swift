//
//  OrderData.swift
//  Assignment1PizzaOrder
//
//  Created by Ryan Franco on 2026-11-13.
//

import UIKit

class OrderData: NSObject {
    
    var id : Int?
    
    var deliveryDate : String?
    
    var address : String?
    
    var size : Int?
    
    var meatToppings : String?
    
    var vegToppings: String?
    
    var avatar: String?
    
    
    func initWithData(theRow i:Int, theDate d:String, theAddress a:String, size s:Int, theMeat m:String, theVeg v:String, theAvatar av:String ){
        
        id = i
        deliveryDate = d
        address = a
        size = s
        meatToppings = m
        vegToppings = v
        avatar = av
        
        
        
    }
    
    
    
    
}
