//
//  ItemsViewController.swift
//  LootLogger
//
//  Created by ABRAR ALQARNI on 11/04/1443 AH.
//

import UIKit

class ItemsViewController: UITableViewController {
  
  var itemStore: ItemStore!
  
  @IBAction func addNewItem(_ sender: UIButton) {
   
        let newItem = itemStore.createItem()
        if let index = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
  }
  
  @IBAction func toggleEditingMode(_ sender: UIButton) {
    
    if isEditing {
      sender.setTitle("Edit", for: .normal)
      setEditing(false, animated: true)
    } else {
      sender.setTitle("Done", for: .normal)
      setEditing(true, animated: true)
    }
    
  }
  
  override func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 65
    
    return itemStore.allItems.count
   
  }
  
  func isBiggerThan50(value: Int)
  -> Bool{
    if(value > 50){
      return true
    }
    return false
  }
  
  func colorOfValue(cell: ItemCell, bigger50: Bool) ->  Void {
    
    if(bigger50){
      cell.valueLabel.textColor = UIColor.red
    }else{
      cell.valueLabel.textColor = UIColor.green
    }
  }
  
  
  override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // Get a new or recycled cell
    
    let cell
    = tableView.dequeueReusableCell(withIdentifier: "ItemCell",
                                      for: indexPath) as! ItemCell
    
    let item = itemStore.allItems[indexPath.row]
    
    cell.nameLabel.text = item.name
    cell.serialNumberLabel.text = item.serialNumber
    cell.valueLabel.text = "$\(item.valueInDollars)"
    colorOfValue(cell: cell, bigger50: isBiggerThan50(value: item.valueInDollars))
    return cell
  }
  
  override func tableView(_ tableView: UITableView,
                          commit editingStyle: UITableViewCell.EditingStyle,
                          forRowAt indexPath: IndexPath) {
      // If the table view is asking to commit a delete command...
      if editingStyle == .delete {
          let item = itemStore.allItems[indexPath.row]
          // Remove the item from the store
          itemStore.removeItem(item)
          // Also remove that row from the table view with an animation
          tableView.deleteRows(at: [indexPath], with: .automatic)
      }
  }
  override func tableView(_ tableView: UITableView,
                          moveRowAt sourceIndexPath: IndexPath,
     // Update the model
  to destinationIndexPath: IndexPath) {
      itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
  }
}
