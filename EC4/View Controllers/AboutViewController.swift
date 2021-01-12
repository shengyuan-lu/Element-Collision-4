//
//  AboutViewController.swift
//  EC4
//
//  Created by 鲁晟远 on 12/31/18.
//  Copyright © 2018 Shengyuan. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set doneButton text properties
        doneButton.titleLabel?.setDropShadow(color: Colors.darkBlue, opacity: 1, width: 0,height: 0.5)
 
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    
}
