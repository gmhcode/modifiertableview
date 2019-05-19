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
//        self.uuid = uuid
        
        
       
        
        self.text.append("\n\(name) is modifier for \(String(describing: isModifierFor.name)) \n")
        
        

//        print("🔴\(isModifierFor.name)")
        
//        print("🆚\(mainOrder.name)")
        
//        if isModifierFor.modifiers == nil {
//            isModifierFor.modifiers = [self]
//        } else {
//            isModifierFor.modifiers?.append(self)
//        }
        
        
//        if isModifierFor == isModifierFor as? Modifier {
//            if mainOrder.modifiers?.contains(isModifierFor as! Modifier) == false {
//                mainOrder.modifiers?.append(isModifierFor as! Modifier)
//            }
//            
//        }
        
        
        
        
        
        
    }
    
    override var modifiers: [Modifier]? {
        didSet{
            self.text = ("\n\(name) is modifier for \(String(describing: isModifierFor.name)) \n")
            self.text.append("""
                            ***Modifiers***
            """)
            
        }
    }
    
}
