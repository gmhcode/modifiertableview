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
    @IBOutlet weak var stackView: UIStackView!
    
    
    
    var orderItem : OrderItem?{
        didSet {
            setViews()
        }
    }
    
    
    
    func setViews(){
        print("🅰️\(String(describing: orderItem?.modifiers))")
        
        itemLabel.text = orderItem?.name
//        guard let orderItem = orderItem else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
        
        
//        orderItem.stackView = stackView
//        OrderItemController.shared.addModifierView(order: orderItem)
//        stackView = orderItem.stackView
        
//        growStackView()
        
    }
    
    
    
    func removeViews(stackView: UIStackView){
        
        var index = 0
        
        for i in stackView.arrangedSubviews {
            if index >= 3 {
                stackView.removeArrangedSubview(i)
            }
            index += 1
        }
    }
    
    
    
    func growStackView(){
        
        guard let modifiers = orderItem?.modifiers else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }


        if modifiers.count > (stackView.subviews.count - 3){

            let newLabel: UILabel = {

                let label = UILabel()
                label.text = modifiers[modifiers.count - 1].name
                label.layer.frame.size.height = 10
                label.textAlignment = .center
                return label

            }()


            print("🈸\(stackView.subviews.count)")

            print("🏧🈸\(modifiers)")
            stackView.addArrangedSubview(newLabel)
        }
        
        

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
    
    
    
    
    @IBAction func reloadTapped(_ sender: Any) {
        
        OrderItemController.shared.orders.append(OrderItem(name: "as"))
        
        let view = self.superview as? UITableView
        
        view?.reloadData()
    }
}
