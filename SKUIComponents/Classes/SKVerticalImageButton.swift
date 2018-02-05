//
//  SKVerticalImageButton.swift
//  SKUIComponents
//
//  Created by Daniel Lee on 2/3/18.
//

import UIKit

@IBDesignable
open class SKVerticalImageButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBInspectable
    open var imageTextPadding: CGFloat = 2.0
    
    @IBInspectable
    open var isImageOnTop: Bool = true
    
    open override func draw(_ rect: CGRect) {
        alignImageAndTitleVertically(padding: imageTextPadding)
    }
    
    func alignImageAndTitleVertically(padding: CGFloat) {
        let imageSize = self.imageView!.frame.size
        let titleSize = self.titleLabel!.frame.size
       
        if isImageOnTop {
            self.imageEdgeInsets = UIEdgeInsets(
                top: -titleSize.height - (imageTextPadding / 2),
                left: 0,
                bottom: 0,
                right: -titleSize.width
            )
            
            self.titleEdgeInsets = UIEdgeInsets(
                top: 0,
                left: -imageSize.width,
                bottom: -imageSize.height - (imageTextPadding / 2),
                right: 0
            )
        }else{
            self.imageEdgeInsets = UIEdgeInsets(
                top: 0,
                left: 0,
                bottom: -titleSize.height - (imageTextPadding / 2),
                right: -titleSize.width
            )
            
            self.titleEdgeInsets = UIEdgeInsets(
                top: 0,
                left: -imageSize.width,
                bottom: imageSize.height + (imageTextPadding / 2),
                right: 0
            )
        }
    }
}
