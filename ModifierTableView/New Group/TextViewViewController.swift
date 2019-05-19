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
    var steak2 : Modifier?
    var potato2 : Modifier?
    var potato3 : Modifier?
    var potato4 : Modifier?
    var potato5 : Modifier?
    lazy var mods : [Modifier] = [potato!,cheese!,baked!,burned!,steak2!]
    
    var dictionary : [String : OrderItem] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        steak2 = Modifier(name: "steak", isModifierFor: steak, mainOrder: steak)
        potato = Modifier(name: "potato", isModifierFor: steak, mainOrder: steak)
        cheese = Modifier(name: "cheese", isModifierFor: potato!, mainOrder: steak)
        baked = Modifier(name: "baked", isModifierFor: cheese!, mainOrder: steak)
        burned = Modifier(name: "burned", isModifierFor: baked!, mainOrder: steak)
        potato2 = Modifier(name: "super", isModifierFor: potato!, mainOrder: steak)
        potato3 = Modifier(name: "sauce", isModifierFor: steak, mainOrder: steak)
        potato4 = Modifier(name: "fries", isModifierFor: steak, mainOrder: steak)
        potato5 = Modifier(name: "fries", isModifierFor: steak, mainOrder: steak)
    }
    

  
    
    @IBAction func newOrderButtonTapped(_ sender: Any) {
        
        
        
        
        
        let food = OrderItem(name: "food \(orders.count)")
        
        
        
        
        steak2 = Modifier(name: "steak", isModifierFor: food, mainOrder: food, uuid: steak2!.uuid)
        potato = Modifier(name: "potato", isModifierFor: food, mainOrder: food, uuid: potato!.uuid)
        cheese = Modifier(name: "cheese", isModifierFor: potato!, mainOrder: food, uuid: cheese!.uuid)
        baked = Modifier(name: "baked", isModifierFor: cheese!, mainOrder: food, uuid: baked!.uuid)
        burned = Modifier(name: "burned", isModifierFor: baked!, mainOrder: food, uuid: burned!.uuid)
        print("❌\(potato?.uuid)")
        
        ModifierController.shared.addModifierToOrder(modifier: steak2!, to: food, mainOrder: food)
        ModifierController.shared.addModifierToOrder(modifier: potato!, to: food, mainOrder: food)
        ModifierController.shared.addModifierToOrder(modifier: cheese!, to: potato!, mainOrder: food)
        ModifierController.shared.addModifierToOrder(modifier: baked!, to: cheese!, mainOrder: food)
        ModifierController.shared.addModifierToOrder(modifier: burned!, to: baked!, mainOrder: food)
        
        
        
        OrderItemController.shared.orders.append(food)
        
        
        //solved
        
        
        dictionary[food.uuid] = food
        dictionary[food.uuid + steak2!.uuid] = steak2
        dictionary[food.uuid + potato!.uuid] = potato
        dictionary[food.uuid + cheese!.uuid] = cheese
        dictionary[food.uuid + baked!.uuid] = baked
        dictionary[food.uuid + burned!.uuid] = burned
        print("🥶\(dictionary)")
        
        
        tableView.reloadData()
        
        
    }
    
    @IBAction func newModifierButtonTapped(_ sender: Any) {
        guard let selectedOrder = selectedOrder else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
//        let index =
        guard let  potato = potato else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}

        potato2 = Modifier(name: "super", isModifierFor: dictionary[selectedOrder.uuid + potato.uuid]!, mainOrder: selectedOrder, uuid: potato2!.uuid)
        
        ModifierController.shared.addModifierToOrder(modifier: potato2!, to: dictionary[selectedOrder.uuid + potato.uuid]!, mainOrder: selectedOrder)
//        ModifierController.shared.sortMods(order: selectedOrder)
        
        
        
        tableView.reloadData()
    }
    
    
    
    @IBAction func burgerButtonTapped(_ sender: Any) {
        
        guard let selectedOrder = selectedOrder, let steak2 = steak2 else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        
        potato3 = Modifier(name: "sauce", isModifierFor: steak2, mainOrder: selectedOrder, uuid: potato3!.uuid)
        ModifierController.shared.addModifierToOrder(modifier: potato3!, to: steak2, mainOrder: selectedOrder)
//        steak2 = Modifier(name: "steak", isModifierFor: selectedOrder, mainOrder: selectedOrder)
//        ModifierController.shared.sortMods(order: selectedOrder)
        tableView.reloadData()
        
//         ModifierController.shared.createModifierFor(order: selectedOrder, name: "burger")
    }
    
    
    @IBAction func potatoButtonTapped(_ sender: Any) {
        guard let selectedOrder = selectedOrder else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        
        potato4 = Modifier(name: "fries", isModifierFor: cheese!, mainOrder: selectedOrder, uuid: potato4!.uuid)
        ModifierController.shared.addModifierToOrder(modifier: potato4!, to: cheese!, mainOrder: selectedOrder)
        
//        ModifierController.shared.sortMods(order: selectedOrder)
        tableView.reloadData()
    }
    
    @IBAction func bakedButtonTapped(_ sender: Any) {
        guard let selectedOrder = selectedOrder else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        
        potato5 = Modifier(name: "beans", isModifierFor: baked!, mainOrder: selectedOrder, uuid: potato5!.uuid)
        ModifierController.shared.addModifierToOrder(modifier: potato5!, to: baked!, mainOrder: selectedOrder)
        //        ModifierController.shared.sortMods(order: selectedOrder)
        tableView.reloadData()
        
    }
    
    
    @IBAction func steakTapped(_ sender: Any) {
        guard let selectedOrder = selectedOrder else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        steak2 = Modifier(name: "steak", isModifierFor: selectedOrder, mainOrder: selectedOrder)
        ModifierController.shared.addModifierToOrder(modifier: steak2!, to: selectedOrder, mainOrder: selectedOrder)
        
        tableView.reloadData()
    }
    
    
    
    
    
    
    @IBAction func removeTapped1(_ sender: Any) {
        ModifierController.shared.removeMod(modifier: potato2!, fromModifier: potato!)
        tableView.reloadData()
    }
    @IBAction func removeTapped2(_ sender: Any) {
        ModifierController.shared.removeMod(modifier: potato3!, fromModifier: steak2!)
        tableView.reloadData()
    }
    @IBAction func removeTapped3(_ sender: Any) {
        ModifierController.shared.removeMod(modifier: potato4!, fromModifier: cheese!)
        tableView.reloadData()
    }
    @IBAction func removeTapped4(_ sender: Any) {
        ModifierController.shared.removeMod(modifier: potato5!, fromModifier: baked!)
        tableView.reloadData()
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
