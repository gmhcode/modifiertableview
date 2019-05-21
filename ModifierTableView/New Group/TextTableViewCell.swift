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
        
        
        
//        adjustUITextViewHeight(arg: modifierTextView)
        
//        ModifierController.shared.mainItemModRecursion2(modifier: orderItem!)
        
        ModifierController.shared.addToMainModArray(order: orderItem!)
        
        
//        ModifierController.shared.sortMods(order: orderItem!)
//        ModifierController.shared.constructText(for: orderItem!)
        
        
        
        
        
        
        orderNameLabel.text = orderItem?.name
        modifierTextView.text = ModifierController.shared.text.joined()
//        modifierTextView.text = ModifierController.shared.text.reversed().joined()
        ModifierController.shared.text = []
           
        adjustUITextViewHeight(arg: modifierTextView)
    }
    
    func adjustUITextViewHeight(arg : UITextView)
    {
//        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
    
    
    func moreText(){
        modifierTextView.text.append(contentsOf: "\n text")
    }
    @IBAction func button(_ sender: Any) {
        moreText()
         adjustUITextViewHeight(arg: modifierTextView)
//        self.superview?.frame.size.height = modifierTextView.layer.frame.height
//        self.bounds.size.height = modifierTextView.layer.frame.height
        
//        let theSuper = superclass as? TextTableViewCell
    
//        super.frame.size.height = modifierTextView.layer.frame.height
        
//        self.layer.frame.size.height = modifierTextView.layer.frame.height
    }
    
    override func prepareForReuse() {
//        adjustUITextViewHeight(arg: modifierTextView)
    }

}
