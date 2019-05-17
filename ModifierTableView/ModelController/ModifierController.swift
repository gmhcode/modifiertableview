//
//  ModifierController.swift
//  ModifierTableView
//
//  Created by Greg Hughes on 5/16/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class ModifierController {
    
    
    static let shared = ModifierController()
    
    var currentModifier : Modifier?
    
    
    
    
//    func addModifier(to order: OrderItem, modifier2: [Modifier]){
//
//        if order.modifiers == nil {
//            order.modifiers = modifier2
//        } else {
//            order.modifiers?.append(contentsOf: modifier2)
//        }
//
//
//
//    }
    
    func createModifierFor(order: OrderItem?, name: String) -> Modifier?{
        
        guard let order = order else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return nil }
        
        let modifier = Modifier(name: "Modifier For \(String(describing: order.name)) " + name + "\n", isModifierFor: order)
        
        if order.modifiers == nil {
            order.modifiers = [modifier]
        } else {
            order.modifiers?.append(modifier)
        }
        
        return modifier
        
    }
    
    
    
    
    
    func addModifierText(for order: OrderItem){
        
        guard let modifiers = order.modifiers else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
        
        let max = modifiers.count
        
        
        var modifierText = ""
        
        for i in modifiers {
            
            modifierText.append(i.name + "\n")
            
            
        }
        order.text = modifierText
    }
    
    
    
    
    
    
    
    
    func constructText(modifiers: [Modifier]) -> String
    {
        
        
        
        return String()
    }
    
    
    
}
