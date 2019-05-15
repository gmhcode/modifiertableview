//
//  OrderItem.swift
//  ModifierTableView
//
//  Created by Greg Hughes on 5/14/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//


import UIKit
class OrderItem{
    
    
    //    var uuid : UUID?
    var modifiers : [Modifier]?
    let uuid : String
    let name : String
    var stackView = UIStackView()
    
    
    init(name: String, uuid : String = UUID().uuidString) {
        self.name = name
        
        self.uuid = uuid
    }
}
extension OrderItem: Equatable {
    static func == (lhs: OrderItem, rhs: OrderItem) -> Bool {
        
        return lhs.uuid == rhs.uuid
            && lhs.name == rhs.name
            && lhs.modifiers == rhs.modifiers
        
    }
}
