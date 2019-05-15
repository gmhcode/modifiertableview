//
//  ViewController.swift
//  ModifierTableView
//
//  Created by Greg Hughes on 5/14/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var orders : [OrderItem] {
        get{
            return OrderItemController.shared.orders
        } set {
            OrderItemController.shared.orders.append(contentsOf: newValue)
        }
    }
    var selectedOrder : OrderItem?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    @IBAction func buttonTapped(_ sender: Any) {
        
        
        
        OrderItemController.shared.createOrderItem(name: "Order \(orders.count)", isModifierFor: nil)
        
        collectionView.reloadData()
        
    }
    
    @IBAction func addModifierButtonTapped(_ sender: Any) {
        selectedOrder?.modifiers?.append(OrderItem(name: "modifier \(selectedOrder?.modifiers?.count)", isModifierFor: selectedOrder))
    }
    
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orders.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.orderItem = orders[indexPath.row]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedOrder = orders[indexPath.row]
    }
    
    
}
