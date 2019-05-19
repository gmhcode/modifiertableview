//
//  TextTableViewCell.swift
//  ModifierTableView
//
//  Created by Greg Hughes on 5/16/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var modifierTextView: UITextView!
    @IBOutlet weak var orderNameLabel: UILabel!
    
    var orderItem : OrderItem? {
        didSet {
            setViews()
        }
    }

    
    
    func setViews(){
        
        
//        ModifierController.shared.constructModTextRecursion(modifier: orderItem!)
        
        
        
        ModifierController.shared.mainItemModRecursion2(modifier: orderItem!)
        
        
//        ModifierController.shared.sortMods(order: orderItem!)
//        ModifierController.shared.constructText(for: orderItem!)
//        print("❌\(orderItem?.modifiers?.count)")
        
        
        orderNameLabel.text = orderItem?.name
        modifierTextView.text = ModifierController.shared.text.reversed().joined()
        ModifierController.shared.text = []
           
        adjustUITextViewHeight(arg: modifierTextView)
    }
    
    func adjustUITextViewHeight(arg : UITextView)
    {
//        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }

}
