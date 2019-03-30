//
//  ImageBoardController.swift
//  Dices
//
//  Created by spoonik on 2016/08/06.
//  Copyright © 2016年 spoonikapps. All rights reserved.
//

import UIKit

class ImageBoardController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  @IBOutlet weak var imageBoard: UIImageView!
  @IBOutlet weak var buttonDraw: UIButton!
  @IBOutlet weak var buttonErase: UIButton!
  
  let gameMan = GameManager.sharedManager
  var lastDrawImage: UIImage!
  var bezierPath: UIBezierPath!
  var drawMode: Bool = true
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    imageBoard.image = gameMan.getBoardImage()
    lastDrawImage = imageBoard.image
  }

  // タッチ開始時の処理
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first
    let currentPoint:CGPoint = touch!.location(in: imageBoard)
    bezierPath = UIBezierPath()
    //bezierPath.lineCapStyle = kCGLineCapRound
    bezierPath.lineWidth = 1.0
    bezierPath.move(to: currentPoint)
  }
  
  // タッチ移動時の処理
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    if bezierPath == nil {
         return
    }
    let touch = touches.first
    let currentPoint:CGPoint = touch!.location(in: imageBoard)
    bezierPath.addLine(to: currentPoint)
    drawLine(path: bezierPath)
  }
  
  // タッチ終了時の処理
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    if bezierPath == nil {
        return
    }
    let touch = touches.first
    let currentPoint:CGPoint = touch!.location(in: imageBoard)
    bezierPath.addLine(to: currentPoint)
    drawLine(path: bezierPath)
    lastDrawImage = imageBoard.image
    gameMan.setBoardImage(img: lastDrawImage)
  }
  
  // 描画処理
  func drawLine(path:UIBezierPath) {
    UIGraphicsBeginImageContext(imageBoard.frame.size)
    if lastDrawImage != nil {
        lastDrawImage.draw(at: CGPoint.zero)
    }
    if drawMode {
      orangeColor.setStroke()
      path.lineWidth = 2
    }
    else {
      UIColor.black.setStroke()
      path.lineWidth = 14
    }
    path.stroke()
    imageBoard.image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
  }

  @IBAction func pushDraw(_ sender: AnyObject) {
    drawMode = true
    buttonDraw.backgroundColor = UIColor.white
    buttonErase.backgroundColor = UIColor.darkGray
  }
  @IBAction func pushErase(_ sender: AnyObject) {
    drawMode = false
    buttonDraw.backgroundColor = UIColor.darkGray
    buttonErase.backgroundColor = UIColor.white
  }
  @IBAction func pushReset(_ sender: AnyObject) {
    UIGraphicsBeginImageContext(imageBoard.frame.size)
    imageBoard.image = UIGraphicsGetImageFromCurrentImageContext()
    lastDrawImage = imageBoard.image
    UIGraphicsEndImageContext()
    
    gameMan.setBoardImage(img: lastDrawImage)
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
