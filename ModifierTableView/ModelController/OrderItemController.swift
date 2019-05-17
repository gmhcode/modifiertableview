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
        
        newOrderItem.stackView = UIStackView()
        newOrderItem.stackView?.axis = .vertical
        newOrderItem.stackView?.distribution = .fillEqually
        newOrderItem.stackView?.spacing = 10
        
        orders.append(newOrderItem)
        currentOrderItem = newOrderItem
    }
    
    func addModifierView(order: OrderItem) {

        
        
        guard let modifiers = order.modifiers else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
        
//        print("🏧🈸\(modifiers)")
   
        
        let newLabel: UILabel = {
            
            let label = UILabel()
            label.text = modifiers[modifiers.count - 1].name
            label.layer.frame.size.height = 10
            label.textAlignment = .center
            return label
        }()
//        print("✅pre\(order.stackView?.arrangedSubviews.count)")
        order.stackView?.addArrangedSubview(newLabel)
        
//        print("✅count\(order.stackView?.arrangedSubviews.count)")
        
        
//        for i in modifiers {
//
//        guard let index = modifiers.firstIndex(of: i) else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
//
//
//
//        let newLabel: UILabel = {
//
//            let label = UILabel()
//            label.text = modifiers[modifiers.count - 1].name
//            label.layer.frame.size.height = 10
//            label.textAlignment = .center
//            return label
//        }()
//            order.stackView?.addArrangedSubview(newLabel)
////            print("🚀height\(order.stackView?.bounds.height)")
//        }
    }
}



extension OrderItemController {
    
    
    
    
    
}
