//
//  Item.swift
//  LootLogger-Ameera-Alhawiti
//
//  Created by Ameera BA on 15/11/2021.
//

import UIKit

class Item: Equatable {
  
  var name: String
  var valueInDollars: Int
  var serialNumber: String?
  var dateCreated: Date
  
  init (name: String,
        serialNumber: String?,
        valueInDollars: Int){
    self.name = name
    self.serialNumber = serialNumber
    self.valueInDollars = valueInDollars
    self.dateCreated = Date()
  }
  
  convenience init(random: Bool = false) {
    if random {
      let adjectives = ["Fluffy", "Rusty", "Shiny"]
      let nouns = ["Bear", "Spork", "Mac Book Pro", "Mac Book Air"]
      let year = ["2019","2020", "2021"]
      let company = ["Apple"]
      let displaySize = ["13.3-inch", "13-inch", "15-inch"]
      let color = ["Gold", "Silver"]
      let type = ["Laptop"]
      
      let randomAdjective = adjectives.randomElement()!
      let randomNoun = nouns.randomElement()!
      let randomYear = year.randomElement()!
      let randomCompany = company.randomElement()!
      let randomProcessorType = displaySize.randomElement()!
      let randomColor = color.randomElement()!
      let randomType = type.randomElement()!
      
      let randomName = "\(randomCompany) \(randomNoun) \(randomProcessorType) \(randomAdjective) \(randomYear) \(randomColor) \(randomType)"
      
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
  
  static func ==(lhs: Item, rhs: Item) -> Bool {
          return lhs.name == rhs.name
    && lhs.serialNumber == rhs.serialNumber
    && lhs.valueInDollars == rhs.valueInDollars
    && lhs.dateCreated == rhs.dateCreated
  }
}
