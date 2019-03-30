//
//  InterfaceController.swift
//  Dices WatchKit Extension
//
//  Created by spoonik on 2016/08/01.
//  Copyright © 2016年 spoonikapps. All rights reserved.
//

import WatchKit
import Foundation


class DiceController: WKInterfaceController {
  @IBOutlet var dice1: WKInterfaceButton!
  @IBOutlet var dice2: WKInterfaceButton!
  @IBOutlet var dice3: WKInterfaceButton!
  @IBOutlet var dice4: WKInterfaceButton!
  @IBOutlet var dice5: WKInterfaceButton!
  @IBOutlet var dice6: WKInterfaceButton!
  
  var diceMan: DiceManager = DiceManager.sharedManager
  var rollTimer: Timer? = nil
  let gameMan = GameManager.sharedManager

  func awakeWithContext(context: AnyObject?) {
    super.awake(withContext: context)
    
    // Configure interface objects here.
    rollTimer = nil
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
    rollTimer = nil
    displayAllDices()
  }
  
  @IBAction func roll() {
    if rollTimer != nil {
      rollTimer?.invalidate()
      rollTimer = nil
    }
    rollTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(DiceController.rolling), userInfo: nil, repeats: true)
    _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(DiceController.stopRolling), userInfo: nil, repeats: false)
  }
  @IBAction func pushReset() {
    diceMan.unlockAll()
    displayAllDices()
  }

  func rolling() {
    _ = diceMan.roll()
    displayAllDices()
  }

  func displayAllDices() {
    displayOneDice(id: 0, button: dice1)
    displayOneDice(id: 1, button: dice2)
    displayOneDice(id: 2, button: dice3)
    displayOneDice(id: 3, button: dice4)
    displayOneDice(id: 4, button: dice5)
    displayOneDice(id: 5, button: dice6)
  }
  
  func displayOneDice(id: Int, button: WKInterfaceButton) {
    let diceNumber = diceMan.getDiceValue(id: id)
    var imageName: String
    if id < gameMan.diceNum {
      imageName = diceMan.dices[id].locked ? "OpaqueDice\(diceNumber)" : "TransDice\(diceNumber)"
    } else {
      imageName = "InvalidDice"
    }
    button.setBackgroundImage(UIImage(named: imageName))
  }
  
  func stopRolling() {
    rollTimer?.invalidate() //stop rolling effect
    rollTimer = nil
  }
  
  @IBAction func pushDice1() {
    _ = diceMan.lockToggle(i: 0)
    displayOneDice(id: 0, button: dice1)
  }
  @IBAction func pushDice2() {
    _ = diceMan.lockToggle(i: 1)
    displayOneDice(id: 1, button: dice2)
  }
  @IBAction func pushDice3() {
    _ = diceMan.lockToggle(i: 2)
    displayOneDice(id: 2, button: dice3)
  }
  @IBAction func pushDice4() {
    _ = diceMan.lockToggle(i: 3)
    displayOneDice(id: 3, button: dice4)
  }
  @IBAction func pushDice5() {
    _ = diceMan.lockToggle(i: 4)
    displayOneDice(id: 4, button: dice5)
  }
  @IBAction func pushDice6() {
    _ = diceMan.lockToggle(i: 5)
    displayOneDice(id: 5, button: dice6)
  }
  
  @IBAction func menuOpenSettings() {
    let context: AnyObject = self
    self.presentController(withName: "SettingsView", context: context)
  }
  
  override func didDeactivate() {
      // This method is called when watch view controller is no longer visible
      super.didDeactivate()
  }

}
