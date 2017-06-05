//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by AKIL KUMAR THOTA on 6/5/17.
//  Copyright © 2017 Akil Kumar Thota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var finalresultLbl: UILabel!
    
    @IBOutlet weak var playAgainBtn: UIButton!
    // 1 = nought, 2 = cross
    var activePlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0]//0 - empty,1 - nought,2 - crosses
    var activePosition = 0
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameActive = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalresultLbl.isHidden = true
        playAgainBtn.isHidden = true
        
        finalresultLbl.center = CGPoint(x: finalresultLbl.center.x - 500, y: finalresultLbl.center.y)
        
        playAgainBtn.center = CGPoint(x: playAgainBtn.center.x - 500, y: playAgainBtn.center.y)
        
        
    }
    
    
    @IBAction func btnPrssd(_ sender: UIButton) {
        
        activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && gameActive{
            
            gameState[activePosition] = activePlayer
            
            
            
            
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named:"nought.png"), for: .normal)
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named:"cross.png"), for: .normal)
                activePlayer = 1
                
            }
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    gameActive = false
                    finalresultLbl.isHidden = false
                    playAgainBtn.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        finalresultLbl.text = "Noughts have Won !!!"
                        
                    }else {
                        finalresultLbl.text = "Crosses have Won !!!"
                        
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.finalresultLbl.center = CGPoint(x: self.finalresultLbl.center.x + 500, y: self.finalresultLbl.center.y)
                        
                        self.playAgainBtn.center = CGPoint(x: self.playAgainBtn.center.x + 500, y: self.playAgainBtn.center.y)
                        
                    })
                }
            }
        }
        
        
        if !gameState.contains(0) && gameActive{
            gameActive = false
            finalresultLbl.isHidden = false
            playAgainBtn.isHidden = false
            finalresultLbl.text = "The Game is a Draw !!! "
            UIView.animate(withDuration: 1, animations: {
                
                self.finalresultLbl.center = CGPoint(x: self.finalresultLbl.center.x + 500, y: self.finalresultLbl.center.y)
                
                self.playAgainBtn.center = CGPoint(x: self.playAgainBtn.center.x + 500, y: self.playAgainBtn.center.y)
                
            })
            
        
        
        
    }
    }
    
    
    @IBAction func playAgainPrssd(_ sender: Any) {
        
        finalresultLbl.isHidden = true
        playAgainBtn.isHidden = true
        
        finalresultLbl.center = CGPoint(x: finalresultLbl.center.x - 500, y: finalresultLbl.center.y)
        
        playAgainBtn.center = CGPoint(x: playAgainBtn.center.x - 500, y: playAgainBtn.center.y)
        
        activePlayer = 1
        gameState = [0,0,0,0,0,0,0,0,0]
        gameActive = true
        
        for i in 1...9 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: .normal)
            }
        }
        
    }
    
    
}

