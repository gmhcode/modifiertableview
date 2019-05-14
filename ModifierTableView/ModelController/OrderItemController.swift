//
//  File.swift
//  ModifierTableView
//
//  Created by Greg Hughes on 5/14/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class OrderItemController{
    
    static let shared = OrderItemController()
    
    var orders : [OrderItem] = []
    var currentOrderItem : OrderItem?
    
    
    func createOrderItem(name: String, isModifierFor: OrderItem?){
        
        let newOrderItem = OrderItem(name: name, isModifierFor: isModifierFor)
        
        orders.append(newOrderItem)
        currentOrderItem = newOrderItem
    }
}
