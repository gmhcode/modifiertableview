//
//  TableViewCell.swift
//  ModifierTableView
//
//  Created by Greg Hughes on 5/15/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
//    @IBOutlet weak var stackView: UIStackView!
    
    
    @IBOutlet weak var reloadButton: UIButton!
    
    var orderItem : OrderItem?{
        didSet {
            setViews()
        }
    }
    var stackView : UIStackView?
    
    
    
    var cellSize = 0
    
    
    
    
    
    
    
    
    func setViews(){
//        print("🅰️\(String(describing: orderItem?.modifiers))")
        
        itemLabel.text = orderItem?.name

//        print("⚡️\(orderItem?.stackView?.arrangedSubviews.count)" + "\(orderItem?.name)")
        
        
    }
    
    
    
    func removeViews(){
        
        var index = 0
//        for i in self.subviews {
//            if i == itemLabel {
//                continue
//            }
//            else {
//
//                stackView?.removeFromSuperview()
//            }
//        }
        
    }
    
    func setStack(){
        removeViews()
        guard let orderItem = orderItem, let stackView = stackView else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return }
        
        
        
        self.addSubview(stackView)
        
        
        stackView.anchor(top: self.safeAreaLayoutGuide.topAnchor, bottom: nil, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 77, paddingBottom:  -8, paddingLeft: 8, paddingRight: -8, width: nil, height: nil)
        
        
        
        if orderItem.modifiers != nil {
            for i in orderItem.modifiers!{
                
                let newLabel: UILabel = {
                    
                    let label = UILabel()
                    label.text = i.name
                    label.layer.frame.size.height = 10
                    label.textAlignment = .center
                    return label
                    
                }()
                stackView.addArrangedSubview(newLabel)
                
            }
        }
    }

    
    
    func growStackView(){
        
        guard let modifiers = orderItem?.modifiers else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }



            let newLabel: UILabel = {

                let label = UILabel()
                label.text = modifiers[modifiers.count].name
                label.layer.frame.size.height = 10
                label.textAlignment = .center
                return label

            }()
    }
    
    override func prepareForReuse() {
        guard let views = stackView?.arrangedSubviews else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}


        for i in views {

            stackView?.removeArrangedSubview(i)
            
            i.removeFromSuperview()
            
        }
        orderItem?.stackView?.removeFromSuperview()
        stackView?.removeFromSuperview()

    }
    
    
    @IBAction func reloadTapped(_ sender: Any) {
        
        #warning("Find a way to change this rows height from inside the cell")
        
        let newLabel: UILabel = {
            
            let label = UILabel()
            label.text = "derp"
            label.layer.frame.size.height = 10
            label.textAlignment = .center
            return label
            
        }()
        stackView?.addArrangedSubview(newLabel)
        
        self.layer.frame.size.height += 10

    }
}
