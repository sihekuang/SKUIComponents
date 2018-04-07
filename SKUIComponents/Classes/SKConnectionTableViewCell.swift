//
//  ConnectionTableViewCell.swift
//  Pods
//
//  Created by Daniel Lee on 12/29/16.
//
//

import UIKit
@IBDesignable
open class SKConnectionTableViewCell: UITableViewCell {

    @IBInspectable
    open var circleArchWidth: CGFloat = 3
    
    @IBInspectable
    open var circleRadius: CGFloat = 10
    
    @IBInspectable
    open var circleColor: UIColor = UIColor.darkGray
    
    @IBInspectable
    open var circlePositionYRatio: CGFloat = 0.5
    
    @IBInspectable
    open var circlePositionXPixel: CGFloat = 5
    
    @IBInspectable
    open var isDrawingTopLine: Bool = true
    
    @IBInspectable
    open var isDrawingBottomLine: Bool = true
    
    @IBInspectable
    open var lineWidth: CGFloat = 2
    
    @IBInspectable
    open var lineColor: UIColor = UIColor.lightGray
    
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    open override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    open override func draw(_ rect: CGRect) {
        
        let archWidth: CGFloat = circleArchWidth
        
        //1. make a rect where the circle goes
        let yPos: CGFloat = circlePositionYRatio * rect.height - circleRadius  // 2 arch width on both sides of the circle, top and bottom
        let xPos: CGFloat = circlePositionXPixel
        let circleBounds = CGRect(x: xPos, y: yPos, width: circleRadius * 2, height: circleRadius * 2)
        
        //2. Draw circle
        _ = SKUIHelper.drawArchRing(startAngleRad: 0.0, endAngleRad: SKUIHelper.twoPi, color: circleColor, bounds: circleBounds, archWidth: archWidth)
        
        //3. draw a line between the mid point of the bottom of the rect/bottom of the circle and the bottom of cell
        lineColor.setStroke()
        
        let midXOfCircle = circleBounds.midX
        let topOfCircle = circleBounds.minY
        let bottomOfCircle = circleBounds.maxY
        
        if isDrawingTopLine{
            let topLinePath = UIBezierPath()
            topLinePath.move(to: CGPoint(x: midXOfCircle, y: rect.minY)) //top-top
            topLinePath.addLine(to: CGPoint(x: midXOfCircle, y: topOfCircle)) //top-bottom
            topLinePath.close()
            
            topLinePath.lineWidth = lineWidth
            topLinePath.stroke()
        }
        
        if isDrawingBottomLine{
            let bottomLinePath = UIBezierPath()
            bottomLinePath.move(to: CGPoint(x: midXOfCircle, y: rect.maxY)) //bottom-bottom
            bottomLinePath.addLine(to: CGPoint(x: midXOfCircle, y: bottomOfCircle)) //bottom-top
            bottomLinePath.close()
            
            bottomLinePath.lineWidth = lineWidth
            bottomLinePath.stroke()
        }
    }
}
