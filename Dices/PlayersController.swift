//
//  PlayersController.swift
//  Dices
//
//  Created by spoonik on 2016/08/03.
//  Copyright © 2016年 spoonikapps. All rights reserved.
//

import UIKit

class PlayersController: UIViewController, UITextFieldDelegate {
  @IBOutlet weak var score1: UITextField!
  @IBOutlet weak var score2: UITextField!
  @IBOutlet weak var score3: UITextField!
  @IBOutlet weak var score4: UITextField!
  
  @IBOutlet weak var labelPlayer2: UILabel!
  @IBOutlet weak var labelPlayer3: UILabel!
  @IBOutlet weak var labelPlayer4: UILabel!
  @IBOutlet weak var labelTempCounter: UILabel!
  
  @IBOutlet weak var sliderTempCounter: UISlider!
  @IBOutlet weak var buttonAddTo: UIButton!
  @IBOutlet weak var buttonSubFrom: UIButton!
  @IBOutlet weak var buttonToPlayer2: UIButton!
  @IBOutlet weak var buttonToPlayer3: UIButton!
  @IBOutlet weak var buttonToPlayer4: UIButton!
  
  let gameMan = GameManager.sharedManager
  var stepOfCount = GameManager.sharedManager.counterStep
  var addToBool = true
  var tempCounter: Int = 1


  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    self.score1.delegate = self
    self.score2.delegate = self
    self.score3.delegate = self
    self.score4.delegate = self

  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // Do any additional setup after loading the view, typically from a nib.
    
    stepOfCount = GameManager.sharedManager.counterStep
    resetTempCounter(invalue: Int(sliderTempCounter.value))
    labelTempCounter.text = "TemporaryCounter:\(Int(sliderTempCounter.value))"
    
    let scores = gameMan.getPreviousScores()
    score1.textColor = orangeColor
    score1.text = "\(scores[0])"
    score2.textColor = orangeColor
    score2.text = "\(scores[1])"
    score3.textColor = orangeColor
    score3.text = "\(scores[2])"
    score4.textColor = orangeColor
    score4.text = "\(scores[3])"
    
    setHiddenState(field: score4, label: labelPlayer4, button: buttonToPlayer4, limit: 4)
    setHiddenState(field: score3, label: labelPlayer3, button: buttonToPlayer3, limit: 3)
    setHiddenState(field: score2, label: labelPlayer2, button: buttonToPlayer2, limit: 2)
    
  }
  
  func setHiddenState(field: UITextField, label: UILabel, button: UIButton, limit: Int) {
    let playerNum = gameMan.playerNum
    field.isHidden = playerNum < limit
    label.isHidden = playerNum < limit
    button.isHidden = playerNum < limit
  }

  @IBAction func pushReset(_ sender: AnyObject) {
    let initScore = gameMan.initScore
  
    score1.text = "\(initScore)"
    score2.text = "\(initScore)"
    score3.text = "\(initScore)"
    score4.text = "\(initScore)"
    
    gameMan.setPlayersScore(score: initScore, playerId: 0)
    gameMan.setPlayersScore(score: initScore, playerId: 1)
    gameMan.setPlayersScore(score: initScore, playerId: 2)
    gameMan.setPlayersScore(score: initScore, playerId: 3)
    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      self.view.endEditing(true)
      return false
  }

  @IBAction func slideTempCounter(_ sender: AnyObject) {
    resetTempCounter(invalue: Int((sender as! UISlider).value))
  }
  func resetTempCounter(invalue: Int) {
    var value = invalue
    value = Int(round(Float(value) / Float(stepOfCount))) * stepOfCount
    if value == 0 {
      value = stepOfCount
    }
    tempCounter = value
    labelTempCounter.text = "TemporaryCounter:\(value)"
    sliderTempCounter.value = Float(value)
  }
  
  
  @IBAction func pushAddTo(_ sender: AnyObject) {
    buttonAddTo.backgroundColor = .darkGray
    buttonSubFrom.backgroundColor = .black
    addToBool = true
  }
  @IBAction func pushSubFrom(_ sender: AnyObject) {
    buttonAddTo.backgroundColor = .black
    buttonSubFrom.backgroundColor = .darkGray
    addToBool = false
  }
  @IBAction func pushToPlayer1(_ sender: AnyObject) {
    addToPlayerScore(field: score1, playerId: 0)
  }
  @IBAction func pushToPlayer2(_ sender: AnyObject) {
    addToPlayerScore(field: score2, playerId: 1)
  }
  @IBAction func pushToPlayer3(_ sender: AnyObject) {
    addToPlayerScore(field: score3, playerId: 2)
  }
  @IBAction func pushToPlayer4(_ sender: AnyObject) {
    addToPlayerScore(field: score4, playerId: 3)
  }
  func addToPlayerScore(field: UITextField, playerId: Int) {
    var value: Int = Int(field.text!)!
    if addToBool {
      value = value + tempCounter
    }
    else {
      value = value - tempCounter
    }
    field.text = "\(value)"
    gameMan.setPlayersScore(score: value, playerId: playerId)
  }
  
  
  // 画面タップでキーボードを閉じるためのハック
  // refer to: http://akio0911.net/archives/13979
  @IBAction func tapScreen(_ sender: AnyObject) {
      self.view.endEditing(true)
  }
  @IBAction func editDidEndScore1(_ sender: AnyObject) {
    setPlayerScore(field: score1, playerId: 0)
  }
  @IBAction func editDidEndScore2(_ sender: AnyObject) {
    setPlayerScore(field: score2, playerId: 1)
  }
  @IBAction func editDidEndScore3(_ sender: AnyObject) {
    setPlayerScore(field: score3, playerId: 2)
  }
  @IBAction func editDidEndScore4(_ sender: AnyObject) {
    setPlayerScore(field: score4, playerId: 3)
  }
  func setPlayerScore(field: UITextField, playerId: Int) {
    let value: Int = Int(field.text!)!
    field.text = "\(value)"
    gameMan.setPlayersScore(score: value, playerId: playerId)
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
