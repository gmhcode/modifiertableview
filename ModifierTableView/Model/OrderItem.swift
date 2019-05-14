//
//  OrderItem.swift
//  ModifierTableView
//
//  Created by Greg Hughes on 5/14/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//


import UIKit
class OrderItem{
    
    var isModifierFor : OrderItem?
    //    var uuid : UUID?
    var modifiers : [OrderItem]?
    let name : String
    
    init(name: String, isModifierFor: OrderItem?) {
        self.name = name
        self.isModifierFor = isModifierFor
    }
}
