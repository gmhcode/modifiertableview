//
//  ViewControllerWithTable.swift
//  ModifierTableView
//
//  Created by Greg Hughes on 5/15/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class ViewControllerWithTable: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedOrder : OrderItem?
    
    var orders : [OrderItem] {
        get{
            return OrderItemController.shared.orders
        } set {
            OrderItemController.shared.orders.append(contentsOf: newValue)
        }
    }
    
    lazy var defaultCellHeight = view.bounds.width * 0.10
    
    var cellSizes : CGFloat?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
    }
    
    @IBAction func buttonTapped(_ sender: Any)
    {
        
        OrderItemController.shared.createOrderItem(name: "Order \(orders.count)")
        tableView.reloadData()
        
    }
    
    @IBAction func addModifierButtonTapped(_ sender: Any) {
        guard let selectedOrder = selectedOrder else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}

        
        
        let modifier = Modifier(name: "modifier \(String(describing: selectedOrder.modifiers?.count))", isModifierFor: selectedOrder, mainOrder: selectedOrder)
        
        if selectedOrder.modifiers == nil {
            selectedOrder.modifiers = [modifier]
        } else {
            selectedOrder.modifiers?.append(modifier)
        }
        
        if selectedOrder != nil {
            OrderItemController.shared.addModifierView(order: selectedOrder)
            print("👨‍💼modifiers\(String(describing: selectedOrder.modifiers))")
//             print("👨‍💼views\(selectedOrder?.stackView?.arrangedSubviews.count)")
        }
        print("👨‍💼views\(String(describing: selectedOrder.stackView?.arrangedSubviews.count))")
//        print("👨‍💼\(String(describing: selectedOrder?.modifiers))")
//        tableView.reloadData()
    }
}




extension ViewControllerWithTable: UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        cell.stackView?.layoutIfNeeded()
        
        
        print("🔴stack views\(String(describing: selectedOrder?.stackView?.arrangedSubviews.count))")
        
//        OrderItemController.shared.addModifierView(order: orders[indexPath.row])
        cell.orderItem = orders[indexPath.row]
        cell.stackView = orders[indexPath.row].stackView
//        print("👨‍💼views\(selectedOrder?.stackView?.arrangedSubviews)")
//        print("🔴stack views\(selectedOrder?.stackView?.arrangedSubviews)")
        cell.setStack()
        
        
        print("❇️🆔stackheight\(String(describing: cell.stackView?.frame.height))")
        
        
        
//        print("🚀\(cell.subviews.count)")
//        print("🚀\(cell.subviews)")
        
        

        
        let stackHeight = defaultCellHeight + (cell.stackView?.frame.height)!
//        print("❇️🆔stackheight\(stackHeight)")
        
        cellSizes = stackHeight
        
        cell.stackView?.setNeedsLayout()
//        cell.setNeedsLayout()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedOrder = orders[indexPath.row]
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return cellSizes ?? 0
//        return 1000
    }
    
//    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return orders.count
//    }
//
//
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
//
//        cell.orderItem = orders[indexPath.row]
//        cell.layer.frame.size.height += cell.stackView.frame.height
//
//
//
//        return cell
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        selectedOrder = orders[indexPath.row]
//    }
    

}
