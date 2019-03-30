//
//  DiceManager.swift
//  Dices
//
//  Created by spoonik on 2016/08/01.
//  Copyright © 2016年 spoonikapps. All rights reserved.
//

import WatchKit

class Dice: NSObject {
  var number: Int = 1
  var locked: Bool = false

  func roll() -> Int {
    if !locked {
      number = Int(arc4random_uniform(6)) + 1
    }
    return number
  }
  
  func lockToggle() -> Bool {
    locked = locked ? false : true
    return locked
  }

}

class DiceManager: NSObject {
  var dices :[Dice] = []
  var diceNum = 6
		
  // Singleton Pattern : BookManager.sharedManager でインスタンスを取得
  static let sharedManager = DiceManager()
  private override init() {
    super.init()

    dices = []
    for _ in 0..<6 {
      let newDice: Dice = Dice()
      dices.append(newDice)
    }
  }

  func roll() -> [Int] {
    var nums: [Int] = []
    for i in 0..<dices.count {
      nums.append(dices[i].roll())
    }
    return nums
  }
  
  func lockToggle(i: Int) -> Bool {
    if i<0 || i>=dices.count {
      print("dice count error")
      return false
    }
    return dices[i].lockToggle()
  }
  func unlockAll() {
    for i in 0..<6 {
      dices[i].locked = false
    }
  }
  
  
  func getTotalScore() -> Int {
    var score = 0
    for i in 0..<diceNum {
      score = score + dices[i].number
    }
    return score
  }
  
  func getDiceValue(id: Int) -> Int {
    if id > diceNum {
      print("dice id error")
      return 0
    }
    return dices[id].number
  }
  func getDiceCount() -> Int {
    return diceNum
  }
  func setDiceCount(num: Int) {
    diceNum = num
  }
}
