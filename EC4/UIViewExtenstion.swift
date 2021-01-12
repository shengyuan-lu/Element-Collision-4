//
//  UIViewExtenstion.swift
//  EC4
//
//  Created by 鲁晟远 on 1/5/19.
//  Copyright © 2019 Shengyuan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setDropShadow(color: UIColor, opacity:Float, width:CGFloat, height:CGFloat) {
        self.layer.shadowOffset = CGSize(width:width, height:height)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = opacity
        self.layer.masksToBounds = false
        self.layer.shadowColor = (color.cgColor)
    }
    
    
}
