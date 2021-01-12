//
//  ButtonExtension.swift
//  EC4
//
//  Created by 鲁晟远 on 1/1/19.
//  Copyright © 2019 Shengyuan. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func setColor(colorOne:UIColor, colorTwo:UIColor) {
        self.setGradientBackground(colorOne: colorOne, colorTwo: colorTwo)

    }
    
    func setRoundCorner(cornerRadius:Int) {
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = CGFloat(cornerRadius)
        
    }
    
    func setTextShadow(color:UIColor) {
        self.titleLabel?.layer.masksToBounds = false
        self.titleLabel?.layer.shadowRadius = 5
        self.titleLabel?.layer.shadowColor = (color.cgColor)
        self.titleLabel?.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.titleLabel?.layer.shadowOpacity = 1
        
    }
    
    
    
}
