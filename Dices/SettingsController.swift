//
//  SettingsController.swift
//  Dices
//
//  Created by spoonik on 2016/08/03.
//  Copyright © 2016年 spoonikapps. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
  @IBOutlet weak var labelDiceNum: UILabel!
  @IBOutlet weak var labelPlayersNum: UILabel!
  @IBOutlet weak var labelMaxCounter: UILabel!
  @IBOutlet weak var labelInitCounter: UILabel!
  @IBOutlet weak var labelCounterStep: UILabel!
  @IBOutlet weak var sliderDices: UISlider!
  @IBOutlet weak var sliderPlayers: UISlider!
  @IBOutlet weak var sliderMaxCounter: UISlider!
  @IBOutlet weak var sliderInitCounter: UISlider!
  @IBOutlet weak var sliderCounterStep: UISlider!

  let gameMan = GameManager.sharedManager
  

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    let diceNum = gameMan.diceNum
    sliderDices.value = Float(diceNum)
    labelDiceNum.text = "Dices:\(diceNum)"

    let playerNum = gameMan.playerNum
    sliderPlayers.value = Float(playerNum)
    labelPlayersNum.text = "Players:\(playerNum)"

    let initCounter = gameMan.initScore
    sliderInitCounter.value = Float(initCounter)
    labelInitCounter.text = "InitialCounter:\(initCounter)"

    let counterStep = gameMan.counterStep
    sliderCounterStep.value = Float(counterStep)
    labelCounterStep.text = "CounterStep:\(counterStep)"
    
    let maxCounter = gameMan.maxScore
    sliderMaxCounter.value = Float(maxCounter)
    labelMaxCounter.text = "MaxCounter:\(maxCounter)"
    
  }
  
  @IBAction func slideDiceNum(_ sender: AnyObject) {
    var value = Int((sender as! UISlider).value)
    if value == 0 {
      value = 1
    }
    labelDiceNum.text = "Dices:\(value)"
    (sender as! UISlider).value = Float(value)
    gameMan.setDiceNum(num: value)
  }
  @IBAction func slidePlayersNum(_ sender: AnyObject) {
    var value = Int((sender as! UISlider).value)
    if value == 0 {
      value = 1
    }
    labelPlayersNum.text = "Players:\(value)"
    (sender as! UISlider).value = Float(value)
    gameMan.setPlayerNum(num: value)
  }
  @IBAction func slideInitCounter(_ sender: AnyObject) {
    let value = Int((sender as! UISlider).value)
    labelInitCounter.text = "InitialCounter:\(value)"
    gameMan.setInitialScore(num: value)
  }
  @IBAction func slideCounterStep(_ sender: AnyObject) {
    var value = Int((sender as! UISlider).value)
    if value == 0 {
      value = 1
    }
    labelCounterStep.text = "CounterStep:\(value)"
    gameMan.setCounterStep(step: value)
  }
  @IBAction func slideMaxCounter(_ sender: AnyObject) {
    let value = Int((sender as! UISlider).value)
    labelMaxCounter.text = "MaxCounter:\(value)"
    gameMan.setMaxScore(num: value)
  }
  

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */

}
