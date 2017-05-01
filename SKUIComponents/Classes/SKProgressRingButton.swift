//
//  ProgressRingButton.swift
//  Pods
//
//  Created by Daniel Lee on 12/28/16.
//
//

import UIKit

@IBDesignable
public class SKProgressRingButton: UIButton {

    
    private var _progress: CGFloat = 0.5
    private let pi = Float.pi
    private let twoPi = 2.0 * Float.pi
    private let quarterPi = Float.pi / 4
    private let halfPi = Float.pi / 2
    
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

        let color = fillColor ?? UIColor.black
        _ = self.drawRingByProgress(progress: self.progress, color: color)
        self.updateLabel(progress: self.progress)
        
    }
    
    private func drawBackgroundRing(){
        self.drawRingByProgress(progress: 1, color: UIColor.clear)
    }
    
    private func drawRingByProgress(progress: CGFloat, color: UIColor){
        let startAngle: CGFloat = 0
        let endAngle = progress * CGFloat(twoPi)
        _ = SKUIHelper.drawArchRing(startAngleRad: startAngle, endAngleRad: endAngle, color: color, bounds: self.bounds)
    }
    
    //MARK: - private methods
    private func updateLabel(progress: CGFloat){
        let value = progress * maxValue
        let valueInt = Int(value)
        self.setTitle("\(valueInt)", for: UIControlState.normal)
    }
}
