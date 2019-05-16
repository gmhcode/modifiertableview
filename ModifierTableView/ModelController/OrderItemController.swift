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
        
        order.stackView = UIStackView()
        order.stackView?.axis = .horizontal
        order.stackView?.distribution = .fillEqually
        order.stackView?.spacing = 10
        
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
        
//        let newLabel: UILabel = {
//
//            let label = UILabel()
//            label.text = modifiers[modifiers.count - 1].name
//            label.layer.frame.size.height = 10
//            label.textAlignment = .center
//            return label
//
//        }()
        
        
        //            print("🈸\(stackView.subviews.count)")
        
        print("🏧🈸\(modifiers)")
        //            stackView.addArrangedSubview(newLabel)
        //        }
        
        
        for i in modifiers {
            
        guard let index = modifiers.firstIndex(of: i) else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }

        let newLabel: UILabel = {

            let label = UILabel()
            label.text = modifiers[modifiers.count - 1].name
            label.layer.frame.size.height = 10
            label.textAlignment = .center
            return label
        }()
            order.stackView?.axis = .vertical
            order.stackView?.addArrangedSubview(newLabel)
        }
        
    } 
}
