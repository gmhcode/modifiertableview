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
    var modifiers : [Modifier]? {
        didSet{
//            if modifiers != nil {
//                for i in modifiers! {
//                    let index = (modifiers?.firstIndex(of: i))!
//                    let appendingString = "\n 🔴**End of Mods For \(name)****"
//                    if index + 1 == modifiers?.count {
//                        i.text.append(contentsOf: "\n ****End of Mods For \(name)****")
//                    } else {
//                        if i.text.contains("🔴"){
//                            let indexOfString = i.text.firstIndex(of: Character("🔴"))!
//                            
//                            i.text.removeLast(appendingString.count)
//                        }
//                    }
//                }
//            }
        }
    }
    var uuid : String
    let name : String
    var text : String = ""
    
    var stackView: UIStackView?
  
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
            && lhs.uuid == rhs.uuid
            && lhs.text == rhs.text
    }
}
extension OrderItem: Hashable
{
    var hashValue: Int {
        return uuid.hashValue
    }
}
