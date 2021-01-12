//
//  CAdropShadow.swift
//  EC4
//
//  Created by 鲁晟远 on 1/30/19.
//  Copyright © 2019 Shengyuan. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    func applySketchShadow( color: UIColor = .black, alpha: Float = 0.5, x: CGFloat = 0, y: CGFloat = 2, blur: CGFloat = 4, spread: CGFloat = 0) {
    
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
        
    }
}
