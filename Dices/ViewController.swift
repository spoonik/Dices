//
//  ViewController.swift
//  Dices
//
//  Created by spoonik on 2016/08/01.
//  Copyright © 2016年 spoonikapps. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  @IBOutlet weak var buttonDice1: UIButton!
  @IBOutlet weak var buttonDice2: UIButton!
  @IBOutlet weak var buttonDice3: UIButton!
  @IBOutlet weak var buttonDice4: UIButton!
  @IBOutlet weak var buttonDice5: UIButton!
  @IBOutlet weak var buttonDice6: UIButton!
  @IBOutlet weak var buttonRoll: UIButton!
  @IBOutlet weak var buttonUnlock: UIButton!

  var diceMan: DiceManager = DiceManager.sharedManager
  let gameMan = GameManager.sharedManager
  var diceNum = GameManager.sharedManager.diceNum
  var rollTimer: Timer? = nil


  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
    displayAllDices()
    
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // Do any additional setup after loading the view, typically from a nib.
    rollTimer = nil
    diceNum = gameMan.diceNum
    displayAllDices()
  }
  
  func rolling() {
    _ = diceMan.roll()
    displayAllDices()
  }
  func stopRolling() {
    rollTimer?.invalidate() //Stop dice rolling. Last state is stayed & fixed
    rollTimer = nil
  }
  
  func displayAllDices() {
    displayOneDice(id: 0, button: buttonDice1)
    displayOneDice(id: 1, button: buttonDice2)
    displayOneDice(id: 2, button: buttonDice3)
    displayOneDice(id: 3, button: buttonDice4)
    displayOneDice(id: 4, button: buttonDice5)
    displayOneDice(id: 5, button: buttonDice6)
  }
  
  func displayOneDice(id: Int, button: UIButton) {
    let diceNumber = diceMan.getDiceValue(id: id)
    var imageName: String
    if id < diceNum {
      imageName = diceMan.dices[id].locked ? "OpaqueDice\(diceNumber)" : "TransDice\(diceNumber)"
    } else {
      imageName = "InvalidDice"
    }
    button.setImage(UIImage(named: imageName), for: UIControlState.normal)
  }

  @IBAction func pushRoll(_ sender: AnyObject) {
    // Timerを使ってダイスのチラチラを表現
    if rollTimer != nil {
      rollTimer?.invalidate()
      rollTimer = nil
    }
    rollTimer = Timer.scheduledTimer(timeInterval: 0.08, target: self, selector: #selector(self.rolling), userInfo: nil, repeats: true)
    _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.stopRolling), userInfo: nil, repeats: false)

    //AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
  }
  
  @IBAction func pushDice1(_ sender: AnyObject) {
    _ = diceMan.lockToggle(i: 0)
    displayOneDice(id: 0, button: buttonDice1)
  }
  @IBAction func pushDice2(_ sender: AnyObject) {
    _ = diceMan.lockToggle(i: 1)
    displayOneDice(id: 1, button: buttonDice2)
  }
  @IBAction func pushDice3(_ sender: AnyObject) {
    _ = diceMan.lockToggle(i: 2)
    displayOneDice(id: 2, button: buttonDice3)
  }
  @IBAction func pushDice4(_ sender: AnyObject) {
    _ = diceMan.lockToggle(i: 3)
    displayOneDice(id: 3, button: buttonDice4)
  }
  @IBAction func pushDice5(_ sender: AnyObject) {
    _ = diceMan.lockToggle(i: 4)
    displayOneDice(id: 4, button: buttonDice5)
  }
  @IBAction func pushDice6(_ sender: AnyObject) {
    _ = diceMan.lockToggle(i: 5)
    displayOneDice(id: 5, button: buttonDice6)
  }
  
  @IBAction func pushUnlock(_ sender: AnyObject) {
    diceMan.unlockAll()
    displayAllDices()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

