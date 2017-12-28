//
//  SKRoundedFilledView.swift
//  SKUIComponents
//
//  Created by Daniel Lee on 12/28/17.
//

import UIKit

public class SKRoundedFilledView: UIView{
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
}
