//
//  UIHelper.swift
//  Pods
//
//  Created by Daniel Lee on 12/28/16.
//
//

import Foundation
import UIKit

class UIHelper{
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
