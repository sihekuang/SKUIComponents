//
//  SKRoundedFilledView.swift
//  SKUIComponents
//
//  Created by Daniel Lee on 12/28/17.
//

import UIKit

@IBDesignable
open class SKRoundedFilledView: UIView{
    @IBInspectable
    open var cornerRadius: CGFloat = 0
    
    @IBInspectable
    open var fillColor: UIColor?
    
    // Shadow
    @IBInspectable
    open var showShadow: Bool = false
    
    @IBInspectable
    open var shadowOffsetX: CGFloat = 0
    
    @IBInspectable
    open var shadowOffsetY: CGFloat = 0
    
    @IBInspectable
    open var shadowRadius: CGFloat = 3
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override open func draw(_ rect: CGRect) {
        // Drawing code
        
        let bgColor = self.fillColor
        let radius = self.cornerRadius
        
        let bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: radius)
        if showShadow{
            SKUIHelper.drawShadow(view: self, bezierPath: bezierPath, cornerRadius: radius, shadowOffsetX: shadowOffsetX, shadowOffsetY: shadowOffsetY, shadowRadius: shadowRadius)
        }
        
        bgColor?.setFill()
        bezierPath.fill()
    }
}
