//
//  ConnectionTableViewCell.swift
//  Pods
//
//  Created by Daniel Lee on 12/29/16.
//
//

import UIKit
@IBDesignable
public class ConnectionTableViewCell: UITableViewCell {

    @IBInspectable
    public var circleArchWidth: CGFloat = 3
    
    @IBInspectable
    public var circleRadius: CGFloat = 10
    
    @IBInspectable
    public var circleColor: UIColor = UIColor.darkGray
    
    @IBInspectable
    public var circlePositionYRatio: CGFloat = 0.5
    
    @IBInspectable
    public var circlePositionXPixel: CGFloat = 5
    
    @IBInspectable
    public var isDrawingTopLine: Bool = true
    
    @IBInspectable
    public var isDrawingBottomLine: Bool = true
    
    @IBInspectable
    public var lineWidth: CGFloat = 2
    
    @IBInspectable
    public var lineColor: UIColor = UIColor.lightGray
    
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public override func draw(_ rect: CGRect) {
        
        let archWidth: CGFloat = circleArchWidth
        
        //1. make a rect where the circle goes
        let yPos: CGFloat = circlePositionYRatio * rect.height - circleRadius  // 2 arch width on both sides of the circle, top and bottom
        let xPos: CGFloat = circlePositionXPixel
        let circleBounds = CGRect(x: xPos, y: yPos, width: circleRadius * 2, height: circleRadius * 2)
        
        //2. Draw circle
        _ = UIHelper.drawRing(startAngleRad: 0.0, endAngleRad: UIHelper.twoPi, color: circleColor, bounds: circleBounds, archWidth: archWidth)
        
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
