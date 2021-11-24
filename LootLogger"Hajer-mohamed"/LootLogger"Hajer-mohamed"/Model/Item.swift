//
//  Item.swift
//  LootLogger"Hajer-mohamed"
//
//  Created by hajer . on 10/04/1443 AH.
//

import UIKit

class Item : Equatable {
  
  var name: String
  var valueInDollars: Int
  var serialNumber: String?
  var dateCreated: Date
  
  init(name: String, serialNumber: String?, valueInDollars: Int) {
    self.name = name
    self.valueInDollars = valueInDollars
    self.serialNumber = serialNumber
    self.dateCreated = Date()
  }
  
  
  static func ==(lhs: Item, rhs: Item) -> Bool {
         return lhs.name == rhs.name
 && lhs.serialNumber == rhs.serialNumber
 && lhs.valueInDollars == rhs.valueInDollars
 && lhs.dateCreated == rhs.dateCreated
  }
  
  
  convenience init(random: Bool = false) {
    if random {
      let adjectives = ["Super Fluffy", "Super Rusty", "Super Shiny"]
      let nouns = ["Bear", "Spork", "Mac Book Pro 14 inch 32 GB"]
      let randomAdjective = adjectives.randomElement()!
      let randomNoun = nouns.randomElement()!
      let randomName = "\(randomAdjective) \(randomNoun)"
      let randomValue = Int.random(in: 0..<100)
      let randomSerialNumber =
        UUID().uuidString.components(separatedBy: "-").first!
      self.init(name: randomName,
                serialNumber: randomSerialNumber,
                valueInDollars: randomValue)
    } else {
      self.init(name: "", serialNumber: nil, valueInDollars: 0)
    }
  }
  
}
