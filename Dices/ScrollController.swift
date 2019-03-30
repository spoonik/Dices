//
//  ScrollController.swift
//  Dices
//
//  Created by spoonik on 2016/08/03.
//  Copyright © 2016年 spoonikapps. All rights reserved.
//

import UIKit

class ScrollController: UIViewController, UIScrollViewDelegate {
  let BETWEEN_WIDTH = CGFloat(5)
  let NUMPAGES = 3
  var barColor = UIColor(red: CGFloat(0.18), green: CGFloat(0.80), blue: CGFloat(0.44), alpha: CGFloat(1.0))
  var pageControl = UIPageControl()

  @IBOutlet weak var scrollView: UIScrollView!

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    self.navigationController?.navigationBar.barTintColor = barColor
    self.navigationController?.navigationBar.tintColor = UIColor.white()
    self.navigationController?.navigationBar.titleTextAttributes = 
        [NSForegroundColorAttributeName: UIColor.white()]

//    scrollView.contentSize = CGSize((self.view.frame.size.width + BETWEEN_WIDTH * 2)
//         * CGFloat(NUMPAGES), self.view.frame.size.height)

    scrollView.isPagingEnabled = true // ページするオプションを有効にするための設定
    scrollView.isScrollEnabled = true
    scrollView.isDirectionalLockEnabled = true
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.showsVerticalScrollIndicator = true
    scrollView.bounces = true
    scrollView.scrollsToTop = false
    scrollView.delegate = self
    
//    var diceView = ViewController(coder: CGRect(x: BETWEEN_WIDTH, y: CGFloat(0),
//        width: self.view.frame.size.width, height: self.view.frame.size.height))
//    var diceView = ViewController()
//    scrollView.addSubview(diceView)

//    self.view.addSubview(scrollView)

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
