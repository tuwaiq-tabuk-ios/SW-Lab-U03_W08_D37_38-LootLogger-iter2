//
//  TableVC.swift
//  Table-ShuruqAlanazi
//
//  Created by Shorouq AlAnzi on 11/04/1443 AH.
//

import UIKit

class ItemsViewController: UITableViewController {
  
  var filteredItems = [[item]]()

  var itemStore: ItemStore! {
      didSet {
          // reload table each time new data is set
          filteredItems = itemStore.filterItemsBy()
          self.tableView.reloadData()
      }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 65
    
  }
  
  @IBAction func addNewItem(_ sender: UIButton) {
    
    // Create a new item and add it to the store
        let newItem = itemStore.createItem()
        // Figure out where that item is in the array
        if let index = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            // Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
   
     @IBAction func toggleEditingMode(_ sender: UIButton) {
     
       if isEditing {
             // Change text of button to inform user of state
             sender.setTitle("Edit", for: .normal)
             // Turn off editing mode
             setEditing(false, animated: true)
         } else {
             // Change text of button to inform user of state
             sender.setTitle("Done", for: .normal)
             // Enter editing mode
             setEditing(true, animated: true)
         }
     }
  
  // MARK: - Table view data source
  // done
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    
    return itemStore.allItems.count
  }
  
  
  // MARK: - Navigation
  // done
  
  override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // Create an instance of UITableViewCell with default appearance
    let cell
      = tableView.dequeueReusableCell(withIdentifier: "ItemCell",for: indexPath) as! ItemCell
  
    let item = itemStore.allItems[indexPath.row]
    cell.nameLabel.text = item.name
      cell.serialNumberLabel.text = item.serialNumber
      cell.valueLabel.text = "$\(item.valueInDollars)"
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
 
// done
override func tableView(_ tableView: UITableView,
                        moveRowAt sourceIndexPath: IndexPath,
   // Update the model
to destinationIndexPath: IndexPath) {
    itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
}

}
