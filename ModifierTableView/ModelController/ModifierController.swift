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
