//
//  RoundedFilledButton.swift
//  SKUIComponents
//
//  Created by Daniel Lee on 7/31/16.
//  Copyright © 2016 Yunikasoft. All rights reserved.
//

import UIKit

@IBDesignable
public class SKRoundedFilledButton: UIButton {

    @IBInspectable
    public var cornerRadius: CGFloat = 0
    
    @IBInspectable
    public var fillColor: UIColor?
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override public func draw(_ rect: CGRect) {
        // Drawing code
        
        let bgColor = self.fillColor
        let radius = self.cornerRadius
        
        let bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: radius)
        
        bgColor?.setFill()
        bezierPath.fill()
    }
    
    public override var isHighlighted: Bool{
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

