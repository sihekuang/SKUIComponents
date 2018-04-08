//
//  SKRoundedGradientFilledView.swift
//  SKUIComponents
//
//  Created by Daniel Lee on 12/28/17.
//

import UIKit

@IBDesignable
open class SKRoundedGradientFilledView: SKRoundedFilledView{
    @IBInspectable
    open var endColor: UIColor?
    
    override open func draw(_ rect: CGRect) {
        
        let startColor = self.fillColor ?? UIColor.white
        let endColor = self.endColor ?? startColor
        let radius = self.cornerRadius
        
        let bezierPath = SKUIHelper.drawRectGradient(rect: rect, startColor: startColor, endColor: endColor, cornerRadius: radius)
        
        guard let path = bezierPath else {return}
        if showShadow{
            SKUIHelper.drawShadow(view: self, bezierPath: path, cornerRadius: cornerRadius, shadowOffsetX: shadowOffsetX, shadowOffsetY: shadowOffsetY, shadowRadius: shadowRadius, color: outlineShadowColor)
        }
    }
}
