//
//  UIHelper.swift
//  Pods
//
//  Created by Daniel Lee on 12/28/16.
//
//

import Foundation
import UIKit


/*!
 * These helper methods are meant to be called in the draw(rect:CGRect) method so it can draw coloring in the components
 */
class UIHelper{
    
    static let twoPi = 2 * CGFloat(M_PI)
    static let quarterPi = CGFloat(M_PI) / 4
    static let halfPi = CGFloat(M_PI) / 2
    
    static func drawRing(startAngleRad: CGFloat, endAngleRad: CGFloat, color: UIColor, bounds: CGRect, archWidth: CGFloat = 3){
        drawCircle(startAngleRad: startAngleRad,
                   endAngleRad: endAngleRad,
                   color: color,
                   bounds: bounds,
                   filled: false,
                   archWidth: archWidth)
    }
    
    static func drawCircle(startAngleRad: CGFloat,
                           endAngleRad: CGFloat,
                           color: UIColor,
                           bounds: CGRect,
                           filled: Bool,
                           archWidth: CGFloat = 3){
        // 1. Determine the center
        let center = CGPoint(x:bounds.width/2 + bounds.origin.x, y: bounds.height/2 + bounds.origin.y)
        
        // 2. Determine the radius
        var radius: CGFloat = min(bounds.width, bounds.height) / 2
        
        // 3. Determine arc width
        let arcWidth: CGFloat = archWidth
        
        
        // 4. Determine Path
        var path = UIBezierPath(arcCenter: center,
                                radius: radius - archWidth,
                                startAngle: startAngleRad - halfPi, //So it would start from the 12 o'clock position
                                endAngle: endAngleRad - halfPi,
                                clockwise: true)
        
        if filled{
            path.addLine(to: center)    
        }
        
        
        // 5. Set stroke
        path.lineWidth = archWidth
        if filled{
            color.setFill()
            path.fill()
        }else{
            color.setStroke()
            path.stroke()
        }
    }
    
    static func drawRectGradient(rect: CGRect, startColor: UIColor, endColor: UIColor, cornerRadius: CGFloat){
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let gradientColors: CFArray = [startColor.cgColor, endColor.cgColor] as CFArray
        let linearGradientLocations: [CGFloat] = [0, 1]
        let lineGradient = CGGradient(colorsSpace: colorSpace, colors: gradientColors, locations: linearGradientLocations)
        
        
        if let context = UIGraphicsGetCurrentContext(){
            let bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
            
            context.saveGState()
            
            bezierPath.fill()
            bezierPath.addClip()
            
            let startPoint = CGPoint(x: rect.origin.x, y: rect.origin.y)
            let endPoint = CGPoint(x: rect.size.width, y: rect.origin.y)
            
            context.drawLinearGradient(lineGradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
        }
    }
}
