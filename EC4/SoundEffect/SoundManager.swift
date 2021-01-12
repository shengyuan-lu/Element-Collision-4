//
//  SoundManager.swift
//  EC4
//
//  Created by 鲁晟远 on 1/1/19.
//  Copyright © 2019 Shengyuan. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        
        case clickto
        case clickback
        case dingcorrect
        case dingwrong
        case gamestart
        case timerstop
        case flip
        
    }
    
    static func playSound(_ effect:SoundEffect) {
        
        var soundFileName = ""
        
        switch effect {
            
        case .clickback:
            soundFileName = "clickback"
        case .clickto:
            soundFileName = "clickto"
        case .dingcorrect:
            soundFileName = "dingcorrect"
        case .dingwrong:
            soundFileName = "dingwrong"
        case .gamestart:
            soundFileName = "gamestart"
        case .timerstop:
            soundFileName = "timerstop"
        case .flip:
            soundFileName = "flip"
            
     
        }
        
        let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: "wav")
        
        guard bundlePath != nil else {
            print("Couldn't find file \(soundFileName) in the bundle")
            return
        }
        
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do {
            // Create audio player object
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            // Play the sound
            audioPlayer?.play()
         
            
        } catch {
            // Could't create audio player object, log the error
            print("Couldn't create the audio player object for sound file \(soundFileName)")
        }
        
    }
    
    
} // End of soundManager class
