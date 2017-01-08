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
    
    
    /*!
     * This method return an arch with gradient color. StartColor ratio is the ratio of what percentage of the start color will fill the arch ring.
     */
    static func getArchLayerWithGradient(bounds: CGRect,
                                         archWidth: CGFloat,
                                         startColorRatio: CGFloat,
                                         startColor: UIColor,
                                         endColor: UIColor,
                                         percentFilled: CGFloat)->CALayer
    {
        //setup
        let lineWidth = archWidth
        let midPointRatio = NSNumber(value: Float(startColorRatio))
        let c1 = startColor
        let c2 = endColor
        let percentRad = percentFilled * UIHelper.twoPi
        let rect = bounds
        
        
        //Gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = rect
        gradientLayer.colors = [c1.cgColor, c1.cgColor, c2.cgColor, UIColor.clear.cgColor];
        gradientLayer.locations = [0, midPointRatio, 1]
        
        
        //apply arch layer to gradient to create the gradiented arch
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        if let con = UIGraphicsGetCurrentContext(){
            
            con.setFillColor(UIColor.clear.cgColor)
            con.setLineWidth(lineWidth)
            
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let radius = rect.width
            let path = getArchBezierPath(startAngleRad: 0, endAngleRad: percentRad, bounds: rect, filled: false, archWidth: lineWidth)
            con.addPath(path.cgPath)
            
            
            con.strokePath()
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            let arcLayer = CALayer()
            arcLayer.frame = rect
            arcLayer.contents = im?.cgImage
            gradientLayer.mask = arcLayer
        }

        return gradientLayer
    }

    static func drawArchRing(startAngleRad: CGFloat,
                             endAngleRad: CGFloat,
                             color: UIColor,
                             bounds: CGRect,
                             archWidth: CGFloat = 3)->UIBezierPath
    {
        return drawArch(startAngleRad: startAngleRad,
                          endAngleRad: endAngleRad,
                          color: color,
                          bounds: bounds,
                          filled: false,
                          archWidth: archWidth)
    }

    /*!
     * This method generate the bezier path for circle/arch
     */
    static func getArchBezierPath(startAngleRad: CGFloat,
                                  endAngleRad: CGFloat,
                                  bounds: CGRect,
                                  filled: Bool,
                                  archWidth: CGFloat)->UIBezierPath
    {
        // 1. Determine the center
        let center = CGPoint(x:bounds.width/2 + bounds.origin.x, y: bounds.height/2 + bounds.origin.y)
        
        // 2. Determine the radius
        let radius: CGFloat = min(bounds.width, bounds.height) / 2
        
        
        // 3. Determine Path
        let path = UIBezierPath(arcCenter: center,
                                radius: radius - archWidth,
                                startAngle: startAngleRad - halfPi, //So it would start from the 12 o'clock position
            endAngle: endAngleRad - halfPi,
            clockwise: true)
        
        if filled{
            path.addLine(to: center)
        }
        
        return path
    }

    /*!
     * This method draw circle. With ability to draw arch
     */
    static func drawArch(startAngleRad: CGFloat,
                         endAngleRad: CGFloat,
                         color: UIColor,
                         bounds: CGRect,
                         filled: Bool,
                         archWidth: CGFloat = 3)->UIBezierPath{
        
        let path = getArchBezierPath(startAngleRad: startAngleRad, endAngleRad: endAngleRad, bounds: bounds, filled: filled, archWidth: archWidth)
        
        // 4. Set stroke/fill
        path.lineWidth = archWidth
        if filled{
            color.setFill()
            path.fill()
        }else{
            color.setStroke()
            path.stroke()
        }
        
        return path
    }
    
    
    /*!
     * This method draws gradient from left to right in square
     */
    static func drawRectGradient(rect: CGRect, startColor: UIColor, endColor: UIColor, cornerRadius: CGFloat){
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let gradientColors: CFArray = [startColor.cgColor, endColor.cgColor] as CFArray
        let linearGradientLocations: [CGFloat] = [0, 1]
        let lineGradient = CGGradient(colorsSpace: colorSpace, colors: gradientColors, locations: linearGradientLocations)
        
        
        if let context = UIGraphicsGetCurrentContext(){
            //Bezier path is for cliping
            let bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
            bezierPath.addClip()
            
            context.saveGState()
            
            
            let startPoint = CGPoint(x: rect.origin.x, y: rect.origin.y)
            let endPoint = CGPoint(x: rect.size.width, y: rect.origin.y)
            
            context.drawLinearGradient(lineGradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
        }
    }
}
