//
//  RoundedGradientFilledButton.swift
//  Pods
//
//  Created by Daniel Lee on 12/28/16.
//
//

import Foundation

@IBDesignable
open class SKRoundedGradientFilledButton: SKRoundedFilledButton{
    
    @IBInspectable
    open var endColor: UIColor?
    
    override open func draw(_ rect: CGRect) {
        
        let startColor = self.fillColor ?? UIColor.white
        let endColor = self.endColor ?? startColor
        let radius = self.cornerRadius
        
        guard let path = SKUIHelper.drawRectGradient(rect: rect, startColor: startColor, endColor: endColor, cornerRadius: radius) else{
            return
        }
        if showShadow{
            SKUIHelper.drawShadow(view: self, bezierPath: path, cornerRadius: cornerRadius, shadowOffsetX: shadowOffsetX, shadowOffsetY: shadowOffsetY, shadowRadius: shadowRadius)
        }
        
    }
    
}
