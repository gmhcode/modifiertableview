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
    
    var selectedOrder : OrderItem?
    
    var orders : [OrderItem] {
        get{
            return OrderItemController.shared.orders
        } set {
            OrderItemController.shared.orders.append(contentsOf: newValue)
        }
    }
    
    
    
    var cellSizes : [CGFloat]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
    }

    @IBAction func buttonTapped(_ sender: Any)
    {
        
        OrderItemController.shared.createOrderItem(name: "Order \(orders.count)")
        collectionView.reloadData()
        
    }
    
    @IBAction func addModifierButtonTapped(_ sender: Any) {
        
//        let modifier = Modifier(name: "modifier \(String(describing: selectedOrder?.modifiers.count))", isModifierForOrder: selectedOrder, isModifierForModifier: nil)
//        
//        selectedOrder?.modifiers.append(modifier)
//        selectedOrder?.modifiers?.append(OrderItem(name: "modifier \(String(describing: selectedOrder?.modifiers?.count))", isModifierFor: selectedOrder))
    }
}






extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orders.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.orderItem = orders[indexPath.row]
        
        
        let stackHeight = 200 + cell.stackView.frame.height
        
        
        if cellSizes == nil {
            cellSizes = [stackHeight]
        }else {
            cellSizes?.append(stackHeight)
        }
//        cell.setNeedsLayout()
        
        
        return cell
    }
    //        cell.layer.frame.size.height += cell.stackView.frame.height

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedOrder = orders[indexPath.row]
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        guard let cellSizes = cellSizes else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  CGSize(width: 0, height: 0) }
        
        return CGSize(width: collectionView.bounds.width, height: cellSizes?[indexPath.row] ?? 0)
//            CGSize(width: collectionView.bounds.width, height: cellSizes?[indexPath.row] ?? 0)
    }
    
    
}
