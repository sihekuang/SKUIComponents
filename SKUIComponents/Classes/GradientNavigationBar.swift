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
    public var startColor: UIColor = UIColor.clear {
        didSet{
            setGradientBackground()
            
        }
    }
    
    @IBInspectable
    public var endColor: UIColor = UIColor.clear{
        didSet{
            setGradientBackground()
        }
    }
    
    func initialize(){
        
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        setGradientBackground()
    }
    
    private func setGradientBackground(){
        let gradientLayer = CAGradientLayer()
        var updatedFrame = self.frame
        updatedFrame.size.height += 20
        gradientLayer.frame = updatedFrame
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(image, for: UIBarMetrics.default)
    }
    
}
