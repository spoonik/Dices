//
//  PlayerControllerInterfaceController.swift
//  Dices
//
//  Created by spoonik on 2016/08/01.
//  Copyright © 2016年 spoonikapps. All rights reserved.
//

import WatchKit
import Foundation


class PlayerControllerInterfaceController: WKInterfaceController {
  @IBOutlet var score1: WKInterfaceLabel!
  @IBOutlet var score2: WKInterfaceLabel!
  @IBOutlet var score3: WKInterfaceLabel!
  @IBOutlet var score4: WKInterfaceLabel!
  @IBOutlet var playerGroup1: WKInterfaceGroup!
  @IBOutlet var playerGroup2: WKInterfaceGroup!
  @IBOutlet var playerGroup3: WKInterfaceGroup!
  @IBOutlet var playerGroup4: WKInterfaceGroup!
  @IBOutlet var sliderPlayer1: WKInterfaceSlider!
  @IBOutlet var sliderPlayer2: WKInterfaceSlider!
  @IBOutlet var sliderPlayer3: WKInterfaceSlider!
  @IBOutlet var sliderPlayer4: WKInterfaceSlider!

  let gameMan = GameManager.sharedManager

  func awakeWithContext(context: AnyObject?) {
    super.awake(withContext: context)
    
    // Configure interface objects here.
  }

  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
    setPlayerNum(num: gameMan.playerNum)
  }
  
  func setMaxScore(maxScore: Int) {
    sliderPlayer1.setNumberOfSteps(maxScore)
    sliderPlayer2.setNumberOfSteps(maxScore)
    sliderPlayer3.setNumberOfSteps(maxScore)
    sliderPlayer4.setNumberOfSteps(maxScore)
  }
  
  func setPlayerNum(num: Int) {
    playerGroup1.setHidden(false)
    playerGroup2.setHidden(num > 1 ? false: true)
    playerGroup3.setHidden(num > 2 ? false: true)
    playerGroup4.setHidden(num > 3 ? false: true)
  }
  
  @IBAction func setPlayerScore1(_ value: Float) {
    let intvalue = Int(value)
    score1.setText("\(intvalue)")
  }
  @IBAction func setPlayerScore2(_ value: Float) {
    let intvalue = Int(value)
    score2.setText("\(intvalue)")
  }
  @IBAction func setPlayerScore3(_ value: Float) {
    let intvalue = Int(value)
    score3.setText("\(intvalue)")
  }
  @IBAction func setPlayerScore4(_ value: Float) {
    let intvalue = Int(value)
    score4.setText("\(intvalue)")
  }

  override func didDeactivate() {
      // This method is called when watch view controller is no longer visible
      super.didDeactivate()
  }

}
