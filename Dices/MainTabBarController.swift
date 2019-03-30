//
//  MainTabBarController.swift
//  Dices
//
//  Created by spoonik on 2016/08/06.
//  Copyright © 2016年 spoonikapps. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    var viewControllers: [UIViewController] = []
  
    let storyBoard: UIStoryboard = UIStoryboard(name:"Main", bundle: Bundle.main)
  
    // iPhone5での画面サイズ設計を、そのまま拡大縮小して表示するハック
    let screenSize: CGRect = UIScreen.main.bounds
    let proportion = screenSize.width / 320.0

    let firstViewController = storyBoard.instantiateViewController(withIdentifier: "DicesView") as! ViewController
    firstViewController.view.transform = CGAffineTransform.init(scaleX: proportion, y: proportion)
    viewControllers.append(firstViewController)

    let secondViewController = storyBoard.instantiateViewController(withIdentifier: "ImageBoardView") as! ImageBoardController
    secondViewController.view.transform = CGAffineTransform.init(scaleX: proportion, y: proportion)
    viewControllers.append(secondViewController)

    let thirdViewController = storyBoard.instantiateViewController(withIdentifier: "CountersView") as! PlayersController
    thirdViewController.view.transform = CGAffineTransform.init(scaleX: proportion, y: proportion)
    viewControllers.append(thirdViewController)

    let fourthViewController = storyBoard.instantiateViewController(withIdentifier: "SettingsView") as! SettingsController
    fourthViewController.view.transform = CGAffineTransform.init(scaleX: proportion, y: proportion)
    viewControllers.append(fourthViewController)

    self.setViewControllers(viewControllers, animated: false)
  }
  

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
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
