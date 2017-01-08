//
//  GradientProgressButton.swift
//  Pods
//
//  Created by Daniel Lee on 1/7/17.
//
//

import UIKit

@IBDesignable
public class GradientProgressButton: UIButton {
    
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
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    public override func draw(_ rect: CGRect) {
        // Drawing code
        
        let gradientArchLayer = UIHelper.getArchLayerWithGradient(bounds: rect,
                                                                  archWidth: archWidth,
                                                                  startColorRatio: startColorRatio,
                                                                  startColor: startColor,
                                                                  endColor: endColor,
                                                                  percentFilled: percent)
        self.layer.addSublayer(gradientArchLayer)
        
    }
}
