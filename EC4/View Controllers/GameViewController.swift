//
//  GameViewController.swift
//  EC4
//
//  Created by 鲁晟远 on 12/31/18.
//  Copyright © 2018 Shengyuan. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    // Create Timer Object
    var gameTimer:Timer?
    var milliseconds:Float = 60 * 1000
    
    // Create score
    var score = 0
    
    // Other variables
    var model = CardModel()
    var knownCard = Card()
    var mysteryCard = Card()
    
    // References 1 Buttons and Labels
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var flipButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var notSure: UILabel!
    @IBOutlet weak var makeAGuess: UILabel!
    @IBOutlet weak var flipButtonTwo: UIButton!
    
    // References 2 ImageViews
    @IBOutlet weak var knownCardTop: UIImageView!
    @IBOutlet weak var mysteryCardTop: UIImageView!
    
    // References 3 UIViews
    @IBOutlet weak var scoreLabelView: UIView!
    @IBOutlet weak var timerLabelView: UIView!
    
    
    
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set properties of the two views
        scoreLabelView.layer.cornerRadius = scoreLabelView.frame.height/5
        timerLabelView.layer.cornerRadius = timerLabelView.frame.height/5
        
        
        // Set button properties
        yesButton.setRoundCorner(cornerRadius: 15)
        noButton.setRoundCorner(cornerRadius: 15)
        flipButton.setRoundCorner(cornerRadius: 15)
        
        
        // Set Timer
        gameTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        RunLoop.current.add(gameTimer!, forMode: RunLoop.Mode.common)
        
        // Fire Timer
        timerElapsed()
        
        // setCards
        setCard()
        
        // DropShadows
        knownCardTop.setDropShadow(color: .gray, opacity: 0.8, width: 0, height: 0.5)
        mysteryCardTop.setDropShadow(color: .gray, opacity: 0.8, width: 0, height: 0.5)
        yesButton.titleLabel?.setDropShadow(color: .gray, opacity: 1, width: 0, height: 0.5)
        noButton.titleLabel?.setDropShadow(color: .gray, opacity: 1, width: 0, height: 0.5)
        flipButton.titleLabel?.setDropShadow(color: .gray, opacity: 1, width: 0, height: 0.5)
        
        
    } // End of viewDidLoad
    
    // No status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func timerElapsed() {
        
        milliseconds -= 1
        
        // Convert to seconds
        let seconds = String(format: "%.1f" , milliseconds/1000)
        
        // Set Label
        timerLabel.text = "\(seconds)"
        
        // Play sound effect
        // When the timer has reached 0
        
        
        if milliseconds <= 0 {
            // Stop the timer
            gameTimer?.invalidate()
            timerLabel.textColor = UIColor.red
            
            // Sound Effect
            SoundManager.playSound(.timerstop)
            
            // Disable all buttons
            disableAllButtons()
            
            // Show Scores Alert
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.7) {
                if self.score > 1 {
                    self.showAlert("Score Report", "Congratulations! You get \(self.score) points in this round.")
                } else if self.score == 0 {
                    self.showAlert("Score Report", "Uh-Oh, you get 0 point in this round.")
                } else if self.score == 1 {
                    self.showAlert("Score Report", "Congratulations! You get 1 point in this round.")
                } else if self.score < 0 {
                    self.showAlert("Score Report", "Uh-Oh, you get \(self.score) points in this round.")
                } // End of if statement
            }
        } // End of if statement
        
    } // End of timerElapsed
    
    // Quit, stop the timer
    @IBAction func quitButton(_ sender: Any) {
        gameTimer?.invalidate()
        scoreLabel.text = "0"
    }
    
    // YesTapped
    @IBAction func yesButton(_ sender: Any) {
        
        changeBackMakeAGuess()
        changeBackNotSure()
        
        if mysteryCard.isFlipped == false {
            if winLose() == true {
                score += 5
                SoundManager.playSound(.dingcorrect)
            } else if winLose() == false {
                score -= 5
                SoundManager.playSound(.dingwrong)
            }
            
        } else if mysteryCard.isFlipped == true {
            
            if winLose() == true {
                score += 5
                SoundManager.playSound(.dingcorrect)
            } else if winLose() == false {
                score -= 5
                SoundManager.playSound(.dingwrong)
            }
            
        }
        
        // Update scoreLabel
        updateScore()
        
        // Get new cards
        setCard()
    }
    
    // NoTapped
    @IBAction func noButton(_ sender: Any) {
        changeBackMakeAGuess()
        changeBackNotSure()
        if mysteryCard.isFlipped == false {
            if winLose() == true {
                score -= 5
                SoundManager.playSound(.dingwrong)
            } else if winLose() == false {
                score += 2
                SoundManager.playSound(.dingcorrect)
            }
            
        } else if mysteryCard.isFlipped == true {
            
            if winLose() == true {
                score -= 5
                SoundManager.playSound(.dingwrong)
            } else if winLose() == false {
                score += 2
                SoundManager.playSound(.dingcorrect)
            }
            
        }
        
        // Update scoreLabel
        updateScore()
        
        // Get new cards
        setCard()
        
    }
    
    // FlipTapped
    @IBAction func flipButton(_ sender: Any) {
        flip()
    }
    @IBAction func flipButtonTwoTapped(_ sender: Any) {
        flip()
    }
    
    
    
    
    
    // setCard Method
    func setCard() {
        
        if mysteryCard.isFlipped == true {
            flipBack()
            flipButtonReset()
            
        }
        
        knownCard = model.getCards()[Int(arc4random_uniform(36))]
        mysteryCard = model.getCards()[Int(arc4random_uniform(36))]
        
        knownCardTop.image = UIImage(named: knownCard.frontImageName)
        mysteryCardTop.image = UIImage(named: mysteryCard.backImageName)

    }
    
    func flip() {
        changeMakeAGuess()
        changeNotSure()
        flipButton.setTitle("Flipped", for: .normal)
        flipButton.isEnabled = false
        flipButtonTwo.isEnabled = false
        flipButton.backgroundColor = Colors.flipButtonDisabled
        mysteryCardTop.image = UIImage(named: mysteryCard.frontImageName)
        UIImageView.transition(with: mysteryCardTop, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], animations: nil, completion: nil)
        SoundManager.playSound(.flip)
        mysteryCard.isFlipped = true
    }
    
    func flipBack() {
        mysteryCardTop.image = UIImage(named: mysteryCard.backImageName)
        mysteryCard.isFlipped = false
    }
    
    func flipButtonReset() {
        flipButton.setTitle("Flip Mystery Card", for: .normal)
        flipButton.isEnabled = true
        flipButton.backgroundColor = Colors.flipButtonEnabled
        flipButtonTwo.isEnabled = true
        
    }
    
    // Change Make a guess label
    func changeMakeAGuess() {
        makeAGuess.text = "Make a choice..."
    }
    
    func changeBackMakeAGuess() {
        makeAGuess.text = "Make a scientific guess..."
    }
    
    // Change notSureLabel
    func changeNotSure() {
        notSure.text = " "
    }
    
    func changeBackNotSure() {
        notSure.text = "Not sure? Tap the button below."
    }
    
    func disableAllButtons() {
        yesButton.isEnabled = false
        noButton.isEnabled = false
        flipButton.isEnabled = false
        flipButtonTwo.isEnabled = false
    }
    
    func enableAllButtons() {
        yesButton.isEnabled = true
        noButton.isEnabled = true
        flipButton.isEnabled = true
        flipButtonTwo.isEnabled = true
    }
    
    func resetAll() {
        SoundManager.playSound(.gamestart)
        gameTimer?.invalidate()
        enableAllButtons()
        scoreLabel.text = "0"
        score = 0
        scoreLabel.textColor = UIColor.black
        timerLabel.textColor = UIColor.black
        milliseconds = 60 * 1000
        viewDidLoad()
        changeBackMakeAGuess()
        changeBackNotSure()
        
    }
    
    func updateScore() {
        if score < 0 {
            self.scoreLabel.textColor = UIColor.red
            scoreLabel.text = String(score)
        } else if score >= 0 {
            self.scoreLabel.textColor = UIColor.black
            scoreLabel.text = String(score)
        }
    }
    
    
    func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Quit", style: .default, handler: { action in
            
            SoundManager.playSound(.clickback)
            self.performSegue(withIdentifier: "prepareExitTwo", sender: self)
            self.gameTimer?.invalidate()
            
        }))
        alert.addAction(UIAlertAction(title: "Restart", style: .destructive, handler: { action in
            self.resetAll()
            
        }))
        
        present(alert, animated: true, completion: nil)
    } // End of showAlert
    
    // winLose Method
    func winLose() -> Bool {
        
        if knownCard.H2SO4 == true && (mysteryCard.NaOH || mysteryCard.KOH || mysteryCard.CaOH2 || mysteryCard.BaOH2 || mysteryCard.CuOH2 || mysteryCard.MgOH2 || mysteryCard.FeOH3 || mysteryCard.AlOH3 || mysteryCard.Na2CO3 || mysteryCard.CaCO3 || mysteryCard.Al || mysteryCard.Fe || mysteryCard.Ca || mysteryCard.Mg || mysteryCard.Zn || mysteryCard.Cu || mysteryCard.C || mysteryCard.CaO || mysteryCard.Fe2O3 || mysteryCard.AlOH3 || mysteryCard.CuO || mysteryCard.SO3) == true {
            return true
            
        } else if mysteryCard.H2SO4 == true && (knownCard.NaOH || knownCard.KOH || knownCard.CaOH2 || knownCard.BaOH2 || knownCard.CuOH2 || knownCard.MgOH2 || knownCard.FeOH3 || knownCard.AlOH3 || knownCard.Na2CO3 || knownCard.CaCO3 || knownCard.Al || knownCard.Fe || knownCard.Ca || knownCard.Mg || knownCard.Zn || knownCard.Cu || knownCard.C || knownCard.CaO || knownCard.Fe2O3 || knownCard.AlOH3 || knownCard.CuO || knownCard.SO3) == true {
            return true
            
        } else if knownCard.HCl == true && (mysteryCard.NaOH || mysteryCard.KOH || mysteryCard.CaOH2 || mysteryCard.BaOH2 || mysteryCard.CuOH2 || mysteryCard.MgOH2 || mysteryCard.FeOH3 || mysteryCard.AlOH3 || mysteryCard.Na2CO3 || mysteryCard.CaCO3 || mysteryCard.AgNO3 || mysteryCard.Al || mysteryCard.Fe || mysteryCard.Ca || mysteryCard.Mg || mysteryCard.Zn || mysteryCard.CaO || mysteryCard.Fe2O3 || mysteryCard.AlOH3 || mysteryCard.CuO) == true {
            return true
            
        } else if mysteryCard.HCl == true && (knownCard.NaOH || knownCard.KOH || knownCard.CaOH2 || knownCard.BaOH2 || knownCard.CuOH2 || knownCard.MgOH2 || knownCard.FeOH3 || knownCard.AlOH3 || knownCard.Na2CO3 || knownCard.CaCO3 || knownCard.AgNO3 || knownCard.Al || knownCard.Fe || knownCard.Ca || knownCard.Mg || knownCard.Zn || knownCard.CaO || knownCard.Fe2O3 || knownCard.AlOH3 || knownCard.CuO) == true {
            return true
            
        } else if knownCard.H2CO3 == true && (mysteryCard.NaOH || mysteryCard.KOH || mysteryCard.CaOH2 || mysteryCard.BaOH2 || mysteryCard.Al || mysteryCard.Fe || mysteryCard.Ca || mysteryCard.Mg || mysteryCard.Zn || mysteryCard.CaO) == true {
            return true
            
        } else if mysteryCard.H2CO3 == true && (knownCard.NaOH || knownCard.KOH || knownCard.CaOH2 || knownCard.BaOH2 || knownCard.Al || knownCard.Fe || knownCard.Ca || knownCard.Mg || knownCard.Zn || knownCard.CaO) == true {
            return true
            
        } else if knownCard.HNO3 == true && (mysteryCard.NaOH || mysteryCard.KOH || mysteryCard.CaOH2 || mysteryCard.BaOH2 || mysteryCard.CuOH2 || mysteryCard.MgOH2 || mysteryCard.FeOH3 || mysteryCard.AlOH3 || mysteryCard.Na2CO3 || mysteryCard.CaCO3 || mysteryCard.Al || mysteryCard.Fe || mysteryCard.Ca || mysteryCard.Mg || mysteryCard.Zn || mysteryCard.CaO || mysteryCard.Fe2O3 || mysteryCard.AlOH3 || mysteryCard.CuO) == true {
            return true
            
        } else if mysteryCard.HNO3 == true && (knownCard.NaOH || knownCard.KOH || knownCard.CaOH2 || knownCard.BaOH2 || knownCard.CuOH2 || knownCard.MgOH2 || knownCard.FeOH3 || knownCard.AlOH3 || knownCard.Na2CO3 || knownCard.CaCO3 || knownCard.Al || knownCard.Fe || knownCard.Ca || knownCard.Mg || knownCard.Zn || knownCard.CaO || knownCard.Fe2O3 || knownCard.AlOH3 || knownCard.CuO) == true {
            return true
            
        } else if knownCard.NaOH == true && (mysteryCard.AlOH3 || mysteryCard.CuSO4 || mysteryCard.AgNO3 || mysteryCard.FeSO4 || mysteryCard.CO2 || mysteryCard.SO3) == true {
            return true
            
        } else if mysteryCard.NaOH == true && (knownCard.AlOH3 || knownCard.CuSO4 || knownCard.AgNO3 || knownCard.FeSO4 || knownCard.CO2 || knownCard.SO3) == true {
            return true
            
        } else if knownCard.KOH == true && (mysteryCard.AlOH3 ||  mysteryCard.CuSO4 || mysteryCard.AgNO3 || mysteryCard.FeSO4 || mysteryCard.Al || mysteryCard.CO2 || mysteryCard.SO3) == true {
            return true
            
        } else if mysteryCard.KOH == true && (knownCard.AlOH3 ||  knownCard.CuSO4 || knownCard.AgNO3 || knownCard.FeSO4 || knownCard.Al || knownCard.CO2 || knownCard.SO3) == true {
            return true
            
        } else if knownCard.CaOH2 == true && (mysteryCard.AlOH3 || mysteryCard.Na2CO3 || mysteryCard.CuSO4 || mysteryCard.AgNO3 || mysteryCard.FeSO4 || mysteryCard.Al || mysteryCard.CO2 || mysteryCard.SO3) == true {
            return true
            
        } else if mysteryCard.CaOH2 == true && (knownCard.AlOH3 || knownCard.Na2CO3 || knownCard.CuSO4 || knownCard.AgNO3 || knownCard.FeSO4 || knownCard.Al || knownCard.CO2 || knownCard.SO3) == true {
            return true
            
        } else if knownCard.BaOH2 == true && (mysteryCard.AlOH3 || mysteryCard.Na2CO3 || mysteryCard.CuSO4 || mysteryCard.Na2SO4 || mysteryCard.AgNO3 || mysteryCard.FeSO4 || mysteryCard.Al || mysteryCard.CO2 || mysteryCard.SO3) == true {
            return true
            
        } else if mysteryCard.BaOH2 == true && (knownCard.AlOH3 || knownCard.Na2CO3 || knownCard.CuSO4 || knownCard.Na2SO4 || knownCard.AgNO3 || knownCard.FeSO4 || knownCard.Al || knownCard.CO2 || knownCard.SO3) == true {
            return true
            
        } else if knownCard.CuOH2 == true && (mysteryCard.CO2 || mysteryCard.SO3) == true {
            return true
            
        } else if mysteryCard.CuOH2 == true && (knownCard.CO2 || knownCard.SO3) == true {
            return true
            
        } else if knownCard.MgOH2 == true && (mysteryCard.CuSO4 || mysteryCard.CO2 || mysteryCard.SO3) == true {
            return true
            
        } else if mysteryCard.MgOH2 == true && (knownCard.CuSO4 || knownCard.CO2 || knownCard.SO3) == true {
            return true
            
        } else if knownCard.FeOH3 == true && (mysteryCard.CuSO4 || mysteryCard.CO2 || mysteryCard.SO3) == true {
            return true
            
        } else if mysteryCard.FeOH3 == true && (knownCard.CuSO4 || knownCard.CO2 || knownCard.SO3) == true {
            return true
            
        } else if knownCard.AlOH3 == true && (mysteryCard.CuSO4 || mysteryCard.CO2 || mysteryCard.SO3) == true {
            return true
            
        } else if mysteryCard.AlOH3 == true && (knownCard.CuSO4 || knownCard.CO2 || knownCard.SO3) == true {
            return true
            
        } else if knownCard.Na2CO3 == true && (mysteryCard.CaCl2 || mysteryCard.AgNO3 || mysteryCard.FeSO4 || mysteryCard.CaO) == true {
            return true
            
        } else if mysteryCard.Na2CO3 == true && (knownCard.CaCl2 || knownCard.AgNO3 || knownCard.FeSO4 || knownCard.CaO) == true {
            return true
            
        } else if knownCard.CuSO4 == true && (mysteryCard.AgNO3 || mysteryCard.Al || mysteryCard.Fe || mysteryCard.Ca || mysteryCard.Mg || mysteryCard.Zn || mysteryCard.CaO ) == true {
            return true
            
        } else if mysteryCard.CuSO4 == true && (knownCard.AgNO3 || knownCard.Al || knownCard.Fe || knownCard.Ca || knownCard.Mg || knownCard.Zn || knownCard.CaO ) == true {
            return true
            
        } else if knownCard.CaCl2 == true && mysteryCard.AgNO3 == true {
            return true
            
        } else if mysteryCard.CaCl2 == true && mysteryCard.AgNO3 == true {
            return true
            
        } else if knownCard.Na2SO4 == true && mysteryCard.AgNO3 == true {
            return true
            
        } else if mysteryCard.Na2SO4 == true && mysteryCard.AgNO3 == true {
            return true
            
        } else if knownCard.AgNO3 == true && (mysteryCard.FeSO4 || mysteryCard.Al || mysteryCard.Fe || mysteryCard.Ca || mysteryCard.Mg || mysteryCard.Zn || mysteryCard.Cu) == true {
            return true
            
        } else if mysteryCard.AgNO3 == true && (knownCard.FeSO4 || knownCard.Al || knownCard.Fe || knownCard.Ca || knownCard.Mg || knownCard.Zn || knownCard.Cu) == true {
            return true
            
        } else if knownCard.FeSO4 == true && (mysteryCard.Al || mysteryCard.Ca || mysteryCard.Mg || mysteryCard.Zn) == true {
            return true
            
        } else if mysteryCard.FeSO4 == true && (knownCard.Al || knownCard.Ca || knownCard.Mg || knownCard.Zn) == true {
            return true
            
        } else if knownCard.Al == true && (mysteryCard.O2 || mysteryCard.Fe2O3 || mysteryCard.CuO ) == true {
            return true
            
        } else if mysteryCard.Al == true && (knownCard.O2 || knownCard.Fe2O3 || knownCard.CuO ) == true {
            return true
            
        } else if knownCard.Fe == true && mysteryCard.O2 == true {
            return true
            
        } else if mysteryCard.Fe == true && knownCard.O2 == true {
            return true
            
        } else if knownCard.Ca == true && (mysteryCard.O2 || mysteryCard.H2 || mysteryCard.H2O) == true {
            return true
            
        } else if mysteryCard.Ca == true && (knownCard.O2 || knownCard.H2 || knownCard.H2O) == true {
            return true
            
        } else if knownCard.Mg == true && (mysteryCard.O2 || mysteryCard.H2) == true {
            return true
            
        } else if mysteryCard.Mg == true && (knownCard.O2 || knownCard.H2) == true {
            return true
            
        } else if knownCard.Zn == true && (mysteryCard.O2) == true {
            return true
            
        } else if mysteryCard.Zn == true && (knownCard.O2) == true {
            return true
            
        } else if knownCard.Cu == true && (mysteryCard.O2) == true {
            return true
            
        } else if mysteryCard.Cu == true && (knownCard.O2) == true {
            return true
            
        } else if knownCard.C == true && (mysteryCard.O2 || mysteryCard.H2O || mysteryCard.CO2) == true {
            return true
            
        } else if mysteryCard.C == true && (knownCard.O2 || knownCard.H2O || knownCard.CO2) == true {
            return true
            
        } else if knownCard.O2 == true && (mysteryCard.H2 || mysteryCard.CO) == true {
            return true
            
        } else if mysteryCard.O2 == true && (knownCard.H2 || knownCard.CO) == true {
            return true
            
        } else if knownCard.H2 == true && (mysteryCard.Fe2O3 || mysteryCard.Al2O3 || mysteryCard.CuO) == true {
            return true
            
        } else if mysteryCard.H2 == true && (knownCard.Fe2O3 || knownCard.Al2O3 || knownCard.CuO) == true {
            return true
            
        } else if knownCard.CaO == true && (mysteryCard.H2O || mysteryCard.CO2 || mysteryCard.SO3) == true {
            return true
            
        } else if mysteryCard.CaO == true && (knownCard.H2O || knownCard.CO2 || knownCard.SO3) == true {
            return true
            
        } else if knownCard.H2O == true && ( mysteryCard.CO2 || mysteryCard.SO3) == true {
            return true
            
        } else if mysteryCard.H2O == true && (knownCard.CO2 || knownCard.SO3) == true {
            return true
            
        } else if knownCard.Fe2O3 == true && (mysteryCard.CO) == true {
            return true
            
        } else if mysteryCard.Fe2O3 == true && (knownCard.CO) == true {
            return true
            
        } else if knownCard.Al2O3 == true && (mysteryCard.CO) == true {
            return true
            
        } else if mysteryCard.Al2O3 == true && (knownCard.CO) == true {
            return true
            
        } else if knownCard.CuO == true && (mysteryCard.CO) == true {
            return true
            
        } else if mysteryCard.CuO == true && (knownCard.CO) == true {
            return true
            
        } else {
            return false
        }
        
        
        
    } // End of winLoseMethod
    
    
} // End of gameViewController
