//
//  Modifier.swift
//  ModifierTableView
//
//  Created by Greg Hughes on 5/15/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class Modifier {
    
    var name : String
    var isModifierForOrder : OrderItem?
    var isModifierForModifier : Modifier?
    var modifiers : [Modifier] = []
    var uuid : String
    
    init(name: String, isModifierForOrder: OrderItem?, isModifierForModifier : Modifier?, uuid : String = UUID().uuidString ) {
        self.name = name
        self.isModifierForOrder = isModifierForOrder
        self.isModifierForModifier = isModifierForModifier
        self.uuid = uuid
    }
    
    
}

extension Modifier: Equatable {
    static func == (lhs: Modifier, rhs: Modifier) -> Bool {
        
        return lhs.uuid == rhs.uuid && lhs.name == rhs.name
            && lhs.isModifierForOrder == rhs.isModifierForOrder
            && lhs.isModifierForModifier == rhs.isModifierForModifier
            && lhs.modifiers == rhs.modifiers
    }
}
