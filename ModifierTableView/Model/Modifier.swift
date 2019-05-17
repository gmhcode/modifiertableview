//
//  Modifier.swift
//  ModifierTableView
//
//  Created by Greg Hughes on 5/15/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class Modifier: OrderItem {
    
    
    var isModifierFor : OrderItem?
    
    
    init(name: String, isModifierFor: OrderItem?, uuid : String = UUID().uuidString ) {
        self.isModifierFor = isModifierFor
        super.init(name: name)
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
