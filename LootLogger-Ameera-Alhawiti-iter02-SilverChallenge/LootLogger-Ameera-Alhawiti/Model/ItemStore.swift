//
//  ItemStore.swift
//  LootLogger-Ameera-Alhawiti
//
//  Created by Ameera BA on 15/11/2021.
//

import UIKit

class ItemStore {
    
  var allItems = [Item]()
  
  var highValueItems: [Item] {
     return allItems.filter{ $0.valueInDollars > 50 }
   }
   
   var otherItems: [Item] {
     return allItems.filter{ $0.valueInDollars <= 50 }
   }
  
  @discardableResult func createItem() -> Item {
      let newItem = Item(random: true)
      allItems.append(newItem)
      return newItem
  }
  
  func removeItem(_ item: Item) {
      if let index = allItems.firstIndex(of: item) {
          allItems.remove(at: index)
      }
  }
  
  
  func moveItem(from fromIndex: Int, to toIndex: Int) {
      if fromIndex == toIndex {
  return }
      
      let movedItem = allItems[fromIndex]
      allItems.remove(at: fromIndex)
      allItems.insert(movedItem, at: toIndex)
  }
}


