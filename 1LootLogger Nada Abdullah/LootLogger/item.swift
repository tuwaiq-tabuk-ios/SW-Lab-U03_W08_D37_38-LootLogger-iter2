import UIKit

class item : Equatable {
  
  static func ==(lhs: item, rhs: item) -> Bool {
    return lhs.name == rhs.name
      && lhs.serialNumber == rhs.serialNumber
      && lhs.valueInDollars == rhs.valueInDollars
      && lhs.dateCreated == rhs.dateCreated
  }
  
  var itemStore: ItemStore!
  
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
  
  convenience init(random: Bool = false) {
    if random {
      let adjectives = ["Fluffy  Fluffy  Fluffy", "Rusty  Rusty  Rusty", "Shiny Shiny Shiny"]
      let nouns = ["Bear  Bear Bear", "Spork Spork Spork", "Mac Mac  Mac"]
      let randomAdjective = adjectives.randomElement()!
      let randomNoun = nouns.randomElement()!
      let randomName = "\(randomAdjective) \(randomNoun)"
      let randomValue = Int.random(in: 0..<100)
      let randomSerialNumber =
        UUID().uuidString.components(separatedBy: "-").first!
      self.init(name: randomName,
                serialNumber: randomSerialNumber ,valueInDollars: randomValue)
    } else {
      self.init(name: "", serialNumber: nil, valueInDollars: 0)
    }
  }
}
