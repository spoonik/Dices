//
//  SettingsControllerInterfaceController.swift
//  Dices
//
//  Created by spoonik on 2016/08/01.
//  Copyright © 2016年 spoonikapps. All rights reserved.
//

import WatchKit
import Foundation


class SettingsControllerInterfaceController: WKInterfaceController {

  @IBOutlet var labelDiceNum: WKInterfaceLabel!
  @IBOutlet var labelPlayerNum: WKInterfaceLabel!
  @IBOutlet var labelMaxScore: WKInterfaceLabel!
  @IBOutlet var sliderDices: WKInterfaceSlider!
  @IBOutlet var sliderPlayers: WKInterfaceSlider!
  @IBOutlet var sliderMaxScore: WKInterfaceSlider!
  
  let gameMan = GameManager.sharedManager
  
  func awakeWithContext(context: AnyObject?) {
    super.awake(withContext: context)
    
    // Configure interface objects here.
    sliderDices.setValue(Float(gameMan.diceNum))
    sliderPlayers.setValue(Float(gameMan.playerNum))
    sliderMaxScore.setValue(Float(gameMan.maxScore))
  }

  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }

  @IBAction func setDiceNum(_ value: Float) {
    var intvalue = Int(value)
    if intvalue == 0 {
      intvalue = 1
    }
    labelDiceNum.setText("\(intvalue)")
    gameMan.setDiceNum(num: intvalue)
  }
  @IBAction func setPlayerNum(_ value: Float) {
    var intvalue = Int(value)
    if intvalue == 0 {
      intvalue = 1
    }
    labelPlayerNum.setText("\(intvalue)")
    gameMan.setPlayerNum(num: intvalue)
  }
  @IBAction func setMaxScore(_ value: Float) {
    let intvalue = Int(value)
    labelMaxScore.setText("\(intvalue)")
    gameMan.setMaxScore(num: intvalue)
  }
  
  
  override func didDeactivate() {
      // This method is called when watch view controller is no longer visible
      super.didDeactivate()
  }

}
