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
    
    
    var orderItem : OrderItem?{
        didSet {
            setViews()
        }
    }
    
    func setViews(){
        itemLabel.text = orderItem?.name
    }
    
    
}
