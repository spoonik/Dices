//
//  PageViewController.swift
//  Dices
//
//  Created by spoonik on 2016/08/03.
//  Copyright © 2016年 spoonikapps. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
//  @IBOutlet var pageControl: UIPageControl!

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
    self.dataSource = self //追加
    
//    self.pageControl.numberOfPages = 3
  }
  
  func getFirst() -> ViewController {
//    self.pageControl.currentPage = 0
    return storyboard!.instantiateViewController(withIdentifier: "DicesView") as! ViewController
  }
  func getSecond() -> ImageBoardController {
//    self.pageControl.currentPage = 1
    return storyboard!.instantiateViewController(withIdentifier: "ImageBoardView") as! ImageBoardController
  }
  func getThird() -> SettingsController {
//    self.pageControl.currentPage = 2
    return storyboard!.instantiateViewController(withIdentifier: "SettingsView") as! SettingsController
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

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
      if viewController is SettingsController {
          // 3 -> 2
          return getSecond()
      } else if viewController is ImageBoardController {
          // 2 -> 1
          return getFirst()
      } else {
          // 1 -> end of the road
          return nil
      }
  }

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
      if viewController is ViewController {
          // 1 -> 2
          return getSecond()
      } else if viewController is ImageBoardController {
          // 2 -> 3
          return getThird()
      } else {
          // 3 -> end of the road
          return nil
      }
  }
  
  //全ページ数を返すメソッド
  func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
      return 3
  }
  //ページコントロールの最初の位置を返すメソッド
  func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
      return 0
  }
  
  
}
