//
//  GradientNavigationBar.swift
//  Pods
//
//  Created by Daniel Lee on 12/28/16.
//
//

import UIKit

@IBDesignable
public class GradientNavigationBar: UINavigationBar {
    
    
    @IBInspectable
    public var startColor: UIColor?
    
    @IBInspectable
    public var endColor: UIColor?
    
    override public func draw(_ rect: CGRect) {
        
        let startColor = self.startColor ?? UIColor.white
        let endColor = self.endColor ?? startColor
        
        UIHelper.drawGradient(rect: rect, startColor: startColor, endColor: endColor, cornerRadius: 0)

    }

    
    
}
