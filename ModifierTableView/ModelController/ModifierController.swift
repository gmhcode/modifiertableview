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
    
    var allMods : [Modifier] = []
    
    
    
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
        
        let modifier = Modifier(name: "Modifier For \(String(describing: order.name)) " + name + "\n", isModifierFor: order, mainOrder: order)
        
        if order.modifiers == nil {
            order.modifiers = [modifier]
        } else {
            order.modifiers?.append(modifier)
        }
        
        return modifier
        
    }
    
    func addModifierToOrder(modifier: Modifier, to order: OrderItem){
        
        if order.modifiers == nil {
            order.modifiers = [modifier]
        } else {
            order.modifiers?.append(modifier)
        }
    }
    
    func addModifierToModifier(modifier: Modifier, toModifier: Modifier, mainOrder: OrderItem){
        
        if toModifier.modifiers == nil {
            toModifier.modifiers = [modifier]
            mainOrder.modifiers?.append(modifier)
        } else {
            toModifier.modifiers?.append(modifier)
            mainOrder.modifiers?.append(modifier)
        }
    }
    
    
    
    
    func sortMods(order: OrderItem){
        
        guard let modifiers = order.modifiers else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}

        
        var pocket : [OrderItem] = []
        
        
        for i in modifiers{
             let modOrder = i.isModifierFor
//            print("⚡️\(modOrder.name)")
            if pocket.contains(modOrder){
                continue
            }else{
                pocket.append(modOrder)
            }
        }
     

        var pocket2 : [Modifier] = []
        
        for i in pocket{
            
            pocket2.append(contentsOf: modifiers.filter({$0.isModifierFor == i}))
            
        }
        pocket2.forEach({print("🌸name: \($0.isModifierFor.name) : uuid \($0.isModifierFor.uuid)")})
        order.modifiers = pocket2
//        print("🌸\(pocket2)")
        
        
    }
    
    
    
    func constructText(for order: OrderItem){
        
        guard let modifiers = order.modifiers else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
        
        
        
        var modifierText = ""
        
        for i in modifiers {
            
            modifierText.append(i.text + "\n")
            
            
        }
        order.text = modifierText
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
