//
//  Modifier.swift
//  ModifierTableView
//
//  Created by Greg Hughes on 5/15/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class Modifier: OrderItem {
    
    
    var isModifierFor : OrderItem
    var mainOrder : OrderItem
    
    init(name: String, isModifierFor: OrderItem, mainOrder: OrderItem, uuid : String = UUID().uuidString )
    {
        self.isModifierFor = isModifierFor
        self.mainOrder = mainOrder
        super.init(name: name)
        self.uuid = uuid
        
        self.text = "\(name) is modifier for \(String(describing: isModifierFor.name))"
        
        
        if isModifierFor != mainOrder {
            isModifierFor.modifiers?.append(self)
        }
        
        if mainOrder.modifiers == nil {
            mainOrder.modifiers = [self]
        } else {
            mainOrder.modifiers?.append(self)
        }
        
    }
}

//extension Modifier: Equatable {
//    static func == (lhs: Modifier, rhs: Modifier) -> Bool {
//
//        return lhs.uuid == rhs.uuid && lhs.name == rhs.name
//            && lhs.isModifierForOrder == rhs.isModifierForOrder
//            && lhs.isModifierForModifier == rhs.isModifierForModifier
//            && lhs.modifiers == rhs.modifiers
//    }
//}
//extension Modifier: Hashable
//{
//    var hashValue: Int {
//        return uuid.hashValue
//    }
//}
