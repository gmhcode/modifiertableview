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
    
    
    
    
    
    
    var text : [String] = []
    
    var modSections : [Modifier]?

    
    func addModifierToOrder(modifier: OrderItem, to order: OrderItem, mainOrder: OrderItem){
        
        let newMod = Modifier(name: modifier.name, isModifierFor: order, mainOrder: mainOrder, uuid: modifier.uuid)
        
        if order.modifiers == nil {
            order.modifiers = [modifier] as! [Modifier]
        } else {
            order.modifiers?.append(modifier as! Modifier)
        }
    }
    
    
    
    func removeMod(modifier: Modifier, fromModifier: OrderItem){
        
        if fromModifier.modifiers != nil {
            
            for i in fromModifier.modifiers!{
                removeMod(modifier: modifier, fromModifier: i)
                
            }
            if (fromModifier.modifiers?.contains(modifier))!
            {
                let index = fromModifier.modifiers?.firstIndex(of: modifier)
                fromModifier.modifiers?.remove(at: index!)
            }
        }
    }
    
    
    func mainItemModRecursion2(modifier: OrderItem)
    
    {
        var allMods : [Modifier] = []
        if modifier.modifiers != nil {
            
            for i in modifier.modifiers!{
                
                allMods.append(i)
                
                
            }
            
            if modifier.modifiers?.isEmpty == false{
                
                for i in allMods {
                    constructModTextRecursion(modifier: i)
                    text.append("\n----------\n")
                    
                    
                }
            }
        }
    }
    
    
    
    
    func mainItemModRecursion(modifier: OrderItem)
    {
        if modifier.modifiers != nil {
            
            for i in modifier.modifiers!{
                
                allMods.append(i)
                
                
            }
            
            if modifier.modifiers?.isEmpty == false{
                
                for i in allMods {
                    constructModTextRecursion(modifier: i)
                    text.append("\n\n")
                }
            }
        }
        
//        allMods = []
//        modifier.text = text.joined()
    }
    
    
    
    
    func constructModTextRecursion(modifier: OrderItem)
    {
        
        
        if modifier.modifiers != nil {
            
            
            
            for i in modifier.modifiers!{
                
                constructModTextRecursion(modifier: i)
            }
////            this is supposed to remove the modifier from its position and put it at the end of the list
//            let index = modifier.isModifierFor.modifiers?.firstIndex(of: modifier)
////
//                modifier.isModifierFor.modifiers?.remove(at: index!)
////                modifier.isModifierFor.modifiers?.insert(modifier, at: 0)
//                modifier.isModifierFor.modifiers?.append(modifier)
            
            
//            if modifier == modifier as? Modifier {
//                let mod = modifier as! Modifier
//
//                let index = mod.isModifierFor.modifiers?.firstIndex(of: modifier as! Modifier)
//                mod.isModifierFor.modifiers?.remove(at: index!)
//
//
//
//
//            }
        }
        text.append(modifier.text)
        
//        print("🆔\(text)")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func sortMods(order: OrderItem)
    {
        
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
