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
    
    var steak = OrderItem(name: "steak")
    var potato : Modifier?
    var cheese : Modifier?
    var baked : Modifier?
    var burned : Modifier?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        potato = Modifier(name: "potato", isModifierFor: steak, mainOrder: steak)
        cheese = Modifier(name: "cheese", isModifierFor: potato!, mainOrder: steak)
        baked = Modifier(name: "baked", isModifierFor: potato!, mainOrder: steak)
        burned = Modifier(name: "burned", isModifierFor: cheese!, mainOrder: steak)
        
        
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
        
        
        
        
        
        let food = OrderItem(name: "food \(orders.count)")
        potato = Modifier(name: "potato", isModifierFor: food, mainOrder: food, uuid: potato!.uuid)
        cheese = Modifier(name: "cheese", isModifierFor: potato!, mainOrder: food, uuid: cheese!.uuid)
        baked = Modifier(name: "baked", isModifierFor: potato!, mainOrder: food, uuid: baked!.uuid)
        burned = Modifier(name: "burned", isModifierFor: cheese!, mainOrder: food, uuid: burned!.uuid)

        
        orders = [food]
        print("❌\(orders)")
        
        tableView.reloadData()
        
        
    }
    
    @IBAction func newModifierButtonTapped(_ sender: Any) {
        guard let selectedOrder = selectedOrder else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}

        
        var potato2 = Modifier(name: "super", isModifierFor: potato!, mainOrder: selectedOrder, uuid: potato!.uuid)
        
        
//        ModifierController.shared.sortMods(order: selectedOrder)
        
        
        
        tableView.reloadData()
    }
    
    
    
    @IBAction func burgerButtonTapped(_ sender: Any) {
        
        guard let selectedOrder = selectedOrder else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        
        var potato3 = Modifier(name: "fries", isModifierFor: selectedOrder, mainOrder: selectedOrder)
        
//        ModifierController.shared.sortMods(order: selectedOrder)
        tableView.reloadData()
        
//         ModifierController.shared.createModifierFor(order: selectedOrder, name: "burger")
    }
    
    
    @IBAction func potatoButtonTapped(_ sender: Any) {
        guard let selectedOrder = selectedOrder else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        
        var potato4 = Modifier(name: "fries", isModifierFor: cheese!, mainOrder: selectedOrder)
        
//        ModifierController.shared.sortMods(order: selectedOrder)
        tableView.reloadData()
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
