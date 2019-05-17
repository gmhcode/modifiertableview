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
        ModifierController.shared.sortMods(order: orderItem!)
        ModifierController.shared.constructText(for: orderItem!)
        
        
        
        
        orderNameLabel.text = orderItem?.name
        modifierTextView.text = orderItem?.text
           
        adjustUITextViewHeight(arg: modifierTextView)
    }
    
    func adjustUITextViewHeight(arg : UITextView)
    {
//        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }

}
