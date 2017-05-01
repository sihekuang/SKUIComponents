//
//  RoundedGradientFilledButton.swift
//  Pods
//
//  Created by Daniel Lee on 12/28/16.
//
//

import Foundation

@IBDesignable
public class SKRoundedGradientFilledButton: SKRoundedFilledButton{
    
    @IBInspectable
    public var endColor: UIColor?
    
    override public func draw(_ rect: CGRect) {
        
        let startColor = self.fillColor ?? UIColor.white
        let endColor = self.endColor ?? startColor
        let radius = self.cornerRadius
        
        SKUIHelper.drawRectGradient(rect: rect, startColor: startColor, endColor: endColor, cornerRadius: radius)
    }
    
}
