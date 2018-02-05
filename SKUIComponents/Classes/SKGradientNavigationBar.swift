//
//  GradientNavigationBar.swift
//  Pods
//
//  Created by Daniel Lee on 12/28/16.
//
//

import UIKit

@IBDesignable
open class SKGradientNavigationBar: UINavigationBar {
    
    private var lastRect: CGRect?
    
    @IBInspectable
    open var startColor: UIColor = UIColor.clear {
        didSet{
            setGradientBackground(force: true)
            
        }
    }
    
    @IBInspectable
    open var endColor: UIColor = UIColor.clear{
        didSet{
            setGradientBackground(force: true)
        }
    }
    
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        setGradientBackground()
    }
    
    //    private func cgRectEqual (lhs: CGRect, rhs: CGRect){
    //        let widthEqual = lhs.size.width == rhs.size.width
    //        let heightEqual = lhs.size.height == rhs.size.height
    //        let xEqual = lhs.origin.x == rhs.origin.x
    //        let yEqual = lhs.origin.y == rhs.origin.y
    //
    //        return widthEqual && heightEqual && xEqual && yEqual
    //    }
    
    
    private func setGradientBackground(force: Bool = false){
    
        if lastRect != nil && lastRect!.equalTo(self.frame) && !force {
            return //this is to prevent unwanted gradient setting
        }
        
        let gradientLayer = CAGradientLayer()
        var updatedFrame = self.frame
        updatedFrame.size.height += 20
        gradientLayer.frame = updatedFrame
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return
        }
        lastRect = self.frame
        gradientLayer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(image, for: UIBarMetrics.default)
    }
    
}



