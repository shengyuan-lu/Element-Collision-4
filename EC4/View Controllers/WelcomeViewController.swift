//
//  ViewController.swift
//  EC4
//
//  Created by 鲁晟远 on 12/30/18.
//  Copyright © 2018 Shengyuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // References
    @IBOutlet weak var startButton: UIButton!
    
    // Segue ways
    @IBAction func aboutThisGame(_ sender: Any) {
        performSegue(withIdentifier: "toAbout", sender: self)
    }
    
    @IBAction func prepareExit(segue: UIStoryboardSegue) {
        SoundManager.playSound(.clickback)
    }
    
    
    @IBAction func prepareExitTwo(segue: UIStoryboardSegue) {
        SoundManager.playSound(.clickback)

    }
    
    
    // Tap Buttons
    @IBAction func aboutButton(_ sender: Any) {
        SoundManager.playSound(.clickto)
    }
    @IBAction func startButton(_ sender: Any) {
        SoundManager.playSound(.gamestart)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.applySketchShadow(color: .black, alpha: 0.30, x: 0, y: 1, blur: 25, spread: 0)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }


}

