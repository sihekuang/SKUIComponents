//
//  RoundedGradientFilledButton.swift
//  Pods
//
//  Created by Daniel Lee on 12/28/16.
//
//

import Foundation

@IBDesignable
public class RoundedGradientFilledButton: RoundedFilledButton{
    
    @IBInspectable
    public var endColor: UIColor?
    
    override public func draw(_ rect: CGRect) {
        // Drawing code
        
        let startColor = self.fillColor ?? UIColor.white
        let endColor = self.endColor ?? startColor
        let radius = self.cornerRadius
        
        
        //Generate gradient
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let gradientColors: CFArray = [startColor.cgColor, endColor.cgColor] as CFArray
        let linearGradientLocations: [CGFloat] = [ 0, 1]
        let lineGradient = CGGradient(colorsSpace: colorSpace, colors: gradientColors, locations: linearGradientLocations)
        
        
        if let context = UIGraphicsGetCurrentContext(){
            let bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: radius)
            
//            context.saveGState()
            
            bezierPath.fill()
            bezierPath.addClip()
            
            let startPoint = CGPoint(x: rect.origin.x, y: rect.origin.y)
            let endPoint = CGPoint(x: rect.size.width, y: rect.origin.y)
            
            context.drawLinearGradient(lineGradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
            
        }
    }
    
}
