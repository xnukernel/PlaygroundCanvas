
import SpriteKit
import UIKit
import PlaygroundSupport


public enum CanvasType {
  case uikit
  case spritekit
  //    case scenekit
}



public class Canvas {
  
  var width:  CGFloat!
  var height: CGFloat!
  var center: CGPoint {
    return CGPoint(x: self.width / 2, y: self.height / 2)
  }
  var frame: CGRect {
    return CGRect(origin: self.center, size: CGSize(width: self.width, height: self.height))
  }
  var size: CGSize{
    return CGSize(width: self.width, height: self.height)
  }
  var type: CanvasType!
  var view: UIView!
  var skView: SKView!
  var scene: SKScene!
  
//  init(width: CGFloat, height: CGFloat) {
//    self.height = height
//    self.width = width
//  }
//  
//  init(frame: CGSize) {
//    self.width = frame.width
//    self.height = frame.height
//  }
//  
//  init(type: CanvasType) {
//    self.type = type
//  }
  
  public init(type: CanvasType, frame: CGSize) {
    self.type = type
    self.width = frame.width
    self.height = frame.height
    
    switch type {
    case .uikit:
      self.view = UIView(frame: CGRect(origin: self.center, size: self.size))
      
    case .spritekit:
      self.skView = SKView(frame: CGRect(origin: self.center, size: self.size))
    }
  }
  
  public func showView() {
    
    guard let lType = self.type else {
      fatalError("Canvas Type is not set prior to use: value cannot be nil")
    }
    
    switch lType {
    case .spritekit:
      PlaygroundPage.current.liveView = self.skView
      self.skView.presentScene(self.scene)
      
    case .uikit:
      PlaygroundPage.current.liveView = self.view
    }
  }
}



