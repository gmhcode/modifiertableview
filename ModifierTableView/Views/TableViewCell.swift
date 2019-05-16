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
    
    
    func setViews(){
        print("🅰️\(String(describing: orderItem?.modifiers))")
        
        itemLabel.text = orderItem?.name
//        guard let orderItem = orderItem else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
        
        
//        orderItem.stackView = stackView
//        OrderItemController.shared.addModifierView(order: orderItem)
//        stackView = orderItem.stackView
        
//        growStackView()
//        removeViews(stackView: stackView)
//        if orderItem?.modifiers != nil {
//            setStack()
//        }
        
        print("⚡️\(orderItem?.stackView?.arrangedSubviews.count)" + "\(orderItem?.name)")
        
        
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
        
//        OrderItemController.shared.addModifierView(order: orderItem)
        self.addSubview(stackView)
        
        
        
        stackView.anchor(top: self.safeAreaLayoutGuide.topAnchor, bottom: nil, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 77, paddingBottom:  -8, paddingLeft: 8, paddingRight: -8, width: nil, height: nil)
//        stackView = orderItem.stackView
    }
    
//    allStackView.anchor(top: self.safeAreaLayoutGuide.topAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 8, paddingBottom: -8, paddingLeft: 8, paddingRight: -8, width: nil, height: nil)
    
    
    func growStackView(){
        
        guard let modifiers = orderItem?.modifiers else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }


//        if modifiers.count > (stackView.subviews.count - 3){

            let newLabel: UILabel = {

                let label = UILabel()
                label.text = modifiers[modifiers.count].name
                label.layer.frame.size.height = 10
                label.textAlignment = .center
                return label

            }()


//            print("🈸\(stackView.subviews.count)")

            print("🏧🈸\(modifiers)")
//            stackView.addArrangedSubview(newLabel)
//        }
    
        

//        if modifiers.count > (stackView.subviews.count - 3){
//        removeViews(stackView: stackView)
//        for (index,i) in modifiers.enumerated(){
//            guard let index = modifiers.firstIndex(of:i) else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); continue}
//
//            let newLabel: UILabel = {
//
//                let label = UILabel()
//                label.text = modifiers[index].name
//                label.layer.frame.size.height = 10
//                return label
//
//
//            }()
//
//
//            print("🈸\(stackView.subviews.count)")
//            print("🏧🈸\(stackView.layer.frame )")
//            stackView.addArrangedSubview(newLabel)
//      }
//    }
    }
    
    override func prepareForReuse() {
        guard let views = stackView?.arrangedSubviews else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}


        for i in views {

            stackView?.removeArrangedSubview(i)

        }
        stackView?.removeFromSuperview()
//        stackView = nil

    }
    
    
    @IBAction func reloadTapped(_ sender: Any) {
        
        OrderItemController.shared.orders.append(OrderItem(name: "as"))
        
        let view = self.superview as? UITableView
        
        view?.reloadData()
    }
}
