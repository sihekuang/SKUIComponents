//
//  GradientProgressButton.swift
//  Pods
//
//  Created by Daniel Lee on 1/7/17.
//
//

import UIKit

@IBDesignable
public class SKGradientProgressButton: UIButton {
    
    @IBInspectable
    public var startColor: UIColor = UIColor.blue
    
    @IBInspectable
    public var endColor: UIColor = UIColor.red
    
    @IBInspectable
    public var archWidth: CGFloat = 5
    
    @IBInspectable
    public var startColorRatio: CGFloat = 0.5
    
    @IBInspectable
    public var percent: CGFloat = 1
    
    public var isAnimating: Bool{
        get{
            if let _ = self.layer.animation(forKey: rotationAnimationKey){
                return true
            }
            return false
        }
    }
    
    let rotationAnimationKey = "rotationAnimation"
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    public override func draw(_ rect: CGRect) {
        // Drawing code
        
        let gradientArchLayer = SKUIHelper.getArchLayerWithGradient(bounds: rect,
                                                                  archWidth: archWidth,
                                                                  startColorRatio: startColorRatio,
                                                                  startColor: startColor,
                                                                  endColor: endColor,
                                                                  percentFilled: percent)
        self.layer.addSublayer(gradientArchLayer)
        
    }
    
    public func beginRotaionAnimation(isClockwise: Bool, periodInSec: Float){
        var rotationAnimation = CABasicAnimation()
        rotationAnimation = CABasicAnimation.init(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = NSNumber(value: (Double.pi * 2.0))
        rotationAnimation.duration = CFTimeInterval(periodInSec)
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = Float(Int.max)
        self.layer.add(rotationAnimation, forKey: rotationAnimationKey)
    }
    
    public func stopRotationAnimation(){
        self.layer.removeAnimation(forKey: rotationAnimationKey)
    }
}
