//
//  ProgressRingButton.swift
//  Pods
//
//  Created by Daniel Lee on 12/28/16.
//
//

import UIKit

@IBDesignable
public class ProgressRingButton: UIButton {

    
    private var _progress: CGFloat = 0.5
    private let pi = CGFloat(M_PI)
    private let twoPi = 2 * CGFloat(M_PI)
    private let quarterPi = CGFloat(M_PI) / 4
    private let halfPi = CGFloat(M_PI) / 2
    
    @IBInspectable var fillColor: UIColor?
    @IBInspectable var maxValue: CGFloat = 100
    
    
    //MARK: - poublic variable
    @IBInspectable var progress: CGFloat {
        get{
            return _progress
        }
        set{
            
            let myProgress = newValue
            _progress = myProgress
            self.setNeedsDisplay()
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override public func draw(_ rect: CGRect) {
        // Drawing code
        self.drawBackgroundRing()
        self.drawRingByProgress(progress: self.progress, color: UIColor.black)
        self.updateLabel(progress: self.progress)
        
    }
    
    private func drawBackgroundRing(){
        let color = fillColor ?? UIColor.lightGray
        self.drawRingByProgress(progress: 1, color: color)
    }
    
    private func drawRingByProgress(progress: CGFloat, color: UIColor){
        let startAngle: CGFloat = 0
        let endAngle = progress * twoPi
        self.drawRing(startAngleRad: startAngle, endAngleRad: endAngle, color: color)
    }
    
    private func drawRing(startAngleRad: CGFloat, endAngleRad: CGFloat, color: UIColor){
        
        
        // 1. Determine the center
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        
        // 2. Determine the radius
        let radius: CGFloat = max(bounds.width, bounds.height) / 2
        
        // 3. Determine arc width
        let arcWidth: CGFloat = 3
        
        
        // 4. Determine Path
        let path = UIBezierPath(arcCenter: center,
                                radius: radius - arcWidth,
                                startAngle: startAngleRad - halfPi, //So it would start from the 12 o'clock position
            endAngle: endAngleRad - halfPi,
            clockwise: true)
        
        // 5. Set stroke
        path.lineWidth = arcWidth
        color.setStroke()
        path.stroke()
    }
    
    //MARK: - private methods
    private func updateLabel(progress: CGFloat){
        let value = progress * maxValue
        let valueInt = Int(value)
        self.setTitle("\(valueInt)", for: UIControlState.normal)
    }
}
