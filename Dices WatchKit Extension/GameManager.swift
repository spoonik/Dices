//
//  GameManager.swift
//  Dices
//
//  Created by spoonik on 2016/08/01.
//  Copyright © 2016年 spoonikapps. All rights reserved.
//

import WatchKit

class GameManager: NSObject {
  let keyDice = "DICENUM"
  let keyPlayer = "PLAYERSCORE"
  let keyBoardImage = "BOARDIMAGE"
  
  var playerScores: [Int] = [0,0,0,0]
  var playerNum: Int = 4
  var maxScore: Int = 60
  var initScore: Int = 0
  var diceNum: Int = 6
  var counterStep: Int = 1
  
  // Singleton Pattern : BookManager.sharedManager でインスタンスを取得
  static let sharedManager = GameManager()
  private override init() {
    super.init()

    let userDefaults = UserDefaults.standard
    if let gameSettings: [Int] = userDefaults.object(forKey: keyDice) as? [Int] {
      diceNum = gameSettings[0]
      playerNum = gameSettings[1]
      maxScore = gameSettings[2]
      initScore = gameSettings[3]
      counterStep = gameSettings[4]
    }
    else {
      diceNum = 6
      playerNum = 2
      maxScore = 30
    }
    if let tempplayscores = userDefaults.object(forKey: keyPlayer) as? [Int] {
      playerScores = tempplayscores
    }
    else {
      playerScores = [0, 0, 0, 0]
    }
  }

  func setDiceNum(num: Int) {
    diceNum =  num
    saveGameInfo()
  }
  func setPlayerNum(num: Int) {
    playerNum =  num
    saveGameInfo()
  }
  func setMaxScore(num: Int) {
    maxScore =  num
    saveGameInfo()
  }
  func setInitialScore(num: Int) {
    initScore =  num
    saveGameInfo()
  }
  func setCounterStep(step: Int) {
    if step < 1 {
      counterStep = 1
    }
    counterStep = step
    saveGameInfo()
  }
  
  func setPlayersScores(scores: [Int]) {
    if scores.count<0 || scores.count>playerNum {
      print("playerId is error")
      return
    }
    for i in 0..<scores.count {
      playerScores[i] = scores[i]
    }
    saveGameInfo()
  }
  func setPlayersScore(score: Int, playerId: Int) {
    if playerId<0 || playerId>playerNum {
      print("playerId is error")
      return
    }
    playerScores[playerId] = score
    saveGameInfo()
  }
  func setBoardImage(img: UIImage) {
    let userDefaults = UserDefaults.standard
    userDefaults.set(UIImagePNGRepresentation(img), forKey: keyBoardImage)
  }
  func getBoardImage() -> UIImage? {
    let userDefaults = UserDefaults.standard
    let imageData: NSData? = userDefaults.object(forKey: keyBoardImage) as? NSData
    if imageData == nil {
      return nil
    }
    return UIImage(data:imageData as! Data)!
  }

  func getPreviousScores() -> [Int] {
    return playerScores
  }
  
  func saveGameInfo() {
    let userDefaults = UserDefaults.standard
    let gameSettings: [Int] = [diceNum, playerNum, maxScore, initScore, counterStep]
    userDefaults.set(gameSettings, forKey: keyDice)
    userDefaults.set(playerScores, forKey: keyPlayer)
    userDefaults.synchronize()
  }
}
