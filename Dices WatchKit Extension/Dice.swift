//
//  Dice.swift
//  Dices
//
//  Created by spoonik on 2016/08/01.
//  Copyright © 2016年 spoonikapps. All rights reserved.
//

import WatchKit

class Dice: NSObject {
  var number: Int = 0
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
