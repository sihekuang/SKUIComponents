//
//  RoundedImageView.swift
//  Pods
//
//  Created by Daniel Lee on 1/2/17.
//
//

import UIKit

@IBDesignable
open class SKRoundedImageView: UIImageView{

    open override func layoutSubviews() {
        
        
        let bounds = self.bounds
        let radius = max(bounds.width, bounds.height) / 2
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        
        super.layoutSubviews()
    }
}
