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
    
    
    func createOrderItem(name: String){
        
        let newOrderItem = OrderItem(name: name)
        
        orders.append(newOrderItem)
        currentOrderItem = newOrderItem
    }
    
    func addModifierView(order: OrderItem) {
//        var one = 1
//        for i in order.stackView.arrangedSubviews{
//            if one == 1 {
//                one += 1
//                continue
//            } else{
//                order.stackView.removeArrangedSubview(i)
//
//            }
//        }
        
        guard let modifiers = order.modifiers else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
        
        
        
        for i in modifiers {
            
        guard let index = modifiers.firstIndex(of: i) else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
            
        let newLabel: UILabel = {
            
            let label = UILabel()
            label.text = modifiers[index].name
            return label
        }()
        
        order.stackView.addArrangedSubview(newLabel)
        }
        
    } 
}
