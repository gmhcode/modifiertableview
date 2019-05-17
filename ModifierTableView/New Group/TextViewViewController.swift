//
//  TextViewViewController.swift
//  ModifierTableView
//
//  Created by Greg Hughes on 5/16/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class TextViewViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedOrder : OrderItem?
    lazy var defaultCellHeight = view.bounds.width * 0.10
    var cellSizes : CGFloat?
    
    var orders : [OrderItem] {
        get{
            return OrderItemController.shared.orders
        } set {
            OrderItemController.shared.orders.append(contentsOf: newValue)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func newOrderButtonTapped(_ sender: Any) {
        
        OrderItemController.shared.createOrderItem(name: "Order \(orders.count)")
        tableView.reloadData()
        
        
    }
    
    @IBAction func newModifierButtonTapped(_ sender: Any) {
        
        
        
        ModifierController.shared.createModifierFor(order: selectedOrder, name: "meat ")
        
        
        tableView.reloadData()
    }
    
    
    
    @IBAction func burgerButtonTapped(_ sender: Any) {
        
        if let modifiers = selectedOrder?.modifiers {
            
            let meatMod = modifiers.first(where: {$0.name.contains("meat")})
            
           
            
            ModifierController.shared.createModifierFor(order: meatMod, name: "burger")
            print("🔴\(selectedOrder?.modifiers?[0].modifiers)")
        } else {
            ModifierController.shared.createModifierFor(order: selectedOrder, name: "burger")
        }
        
        tableView.reloadData()
        
//         ModifierController.shared.createModifierFor(order: selectedOrder, name: "burger")
    }
    
    
    @IBAction func potatoButtonTapped(_ sender: Any) {
    }
    
    @IBAction func bakedButtonTapped(_ sender: Any) {
    }
    
    
    
    
    
    
    
    
}



extension TextViewViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TextTableViewCell
        
        
        
        cell.orderItem = orders[indexPath.row]
        let stackHeight = defaultCellHeight + cell.modifierTextView.frame.height
        cellSizes = stackHeight
        
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellSizes ?? 0
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedOrder = orders[indexPath.row]
    }
}
