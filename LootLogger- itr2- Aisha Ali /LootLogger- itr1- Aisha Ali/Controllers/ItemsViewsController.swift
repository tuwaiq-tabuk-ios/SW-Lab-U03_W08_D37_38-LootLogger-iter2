//
//  TableVC.swift
//  LootLogger- itr1- Aisha Ali
//
//  Created by Aisha Ali on 11/14/21.
//

import UIKit

class ItemsViewController: UITableViewController {
  
  var filteredItems = [[Item]]()
  
  var itemStore: ItemStore!
  
  
  //MARK: - add New Item
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
  
  //MARK: - ViewDidLoad
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 65
  }
  
//  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    
    return 1
  }
  
  

  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return itemStore.allItems.count

  }
  
  //MARK: - Adding sorted items
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell",
                                             for: indexPath) as! ItemCell
    
    let item = itemStore.allItems[indexPath.row]

    
    cell.nameLabel.text = item.name
    cell.serialNumberLabel.text = item.serialNumber
    
    overlapping(cell.nameLabel)
    overlapping(cell.serialNumberLabel)
    
    if item.valueInDollars >= 50 {
      
      cell.valueLabel.textColor = .red
      
    } else {
      
      cell.valueLabel.textColor = .green
    }
    
    cell.valueLabel.text = "$\(item.valueInDollars)"
    
    return cell
  }
  
  
  //MARK: - Delete Rows
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
    if editingStyle == .delete {
      let item = itemStore.allItems[indexPath.row]
      itemStore.removeItem(item)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }
  
  
  override func tableView(_ tableView: UITableView,moveRowAt sourceIndexPath: IndexPath,to destinationIndexPath: IndexPath) {
    
    itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
  }
}









