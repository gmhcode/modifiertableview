//
//  CollectionViewCell.swift
//  ModifierTableView
//
//  Created by Greg Hughes on 5/14/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    
    
    var orderItem : OrderItem?{
        didSet {
            setViews()
        }
    }
    
    
    
    
    
    
    
    
    
    func setViews(){
        itemLabel.text = orderItem?.name
        
    }
    
    
    
    
    
    @IBAction func reloadTapped(_ sender: Any) {
        
        OrderItemController.shared.orders.append(OrderItem(name: "as"))
        
        let view = self.superview as? UICollectionView
        view?.reloadData()
    }
    
    
}
