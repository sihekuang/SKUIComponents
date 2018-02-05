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
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override open func draw(_ rect: CGRect) {
        // Drawing code
        
        let bgColor = self.fillColor
        let radius = self.cornerRadius
        
        let bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: radius)
        
        bgColor?.setFill()
        bezierPath.fill()
    }
}
