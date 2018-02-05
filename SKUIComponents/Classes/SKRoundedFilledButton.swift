//
//  RoundedFilledButton.swift
//  SKUIComponents
//
//  Created by Daniel Lee on 7/31/16.
//  Copyright © 2016 Yunikasoft. All rights reserved.
//

import UIKit

@IBDesignable
open class SKRoundedFilledButton: UIButton {

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
    
    open override var isHighlighted: Bool{
        set{
            super.isHighlighted = newValue
            if isHighlighted{
                self.alpha = 0.5
            }else{
                self.alpha = 1
            }
        }
        
        get{
            return super.isHighlighted
        }
    }
}


