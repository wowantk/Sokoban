//
//  ViewController.swift
//  Blocks 1.3
//
//  Created by Mac on 28.12.2020.
//

import UIKit
import PKHUD
class ViewController: UIViewController , MethodGame{
    @IBOutlet weak public var gameOutput: UITextView!
    
    @IBOutlet public weak var scoreTab: UILabel!
    
    @IBOutlet public weak var gameText: UILabel!
    
    
    @IBAction func newGameButton(_ sender: UIButton) {
        self.NewGame(pl: startingPlayer, bx: startingBox)
    }
    
    @IBAction func goDownButton(_ sender: UIButton) {
        gameOutput.text = game.moveOn(go: .down)
        scoreTab.text = "Moves: \(countOfMoves)"
        checkWin()
        
    }
    
    
    @IBAction func goUpButton(_ sender: UIButton) {
        gameOutput.text = game.moveOn(go: .up)
        scoreTab.text = "Moves: \(countOfMoves)"
        checkWin()
    }
    
    
    @IBAction func goLeftButton(_ sender: UIButton) {
        gameOutput.text = game.moveOn(go: .left)
        scoreTab.text = "Moves: \(countOfMoves)"
        checkWin()
    }
    
    
    @IBAction func goRightButton(_ sender: UIButton) {
        gameOutput.text = game.moveOn(go: .right)
        scoreTab.text = "Moves: \(countOfMoves)"
        checkWin()
    }
    
    func NewGame(pl: PositionInRoom, bx: Box) {
        countOfMoves = 0
        scoreTab.text = "Moves: \(countOfMoves)"
        player.positionX = pl.positionX
        box.positionX = bx.positionX
        player.positionY = pl.positionY
        box.positionY = bx.positionY
        gameOutput.text = field
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "test", let vc = segue.destination as? ViewControllerSettings{
            vc.modalPresentationStyle = .fullScreen
    vc.delegate = self
        }
    }
    
    func checkWin()->Void{
        
        if box.positionX == endGame.positionX && box.positionY == endGame.positionY {
//            let controller = UIAlertController(title: "You win", message: "Win", preferredStyle: .alert)
            HUD.flash(.success, delay: 1)
//            let action = UIAlertAction(title: "OK", style: .default, handler:nil)
//            controller.addAction(action)
//            self.present(controller, animated: true, completion: nil)
            box.positionX = startingBox.positionX
            box.positionY = startingBox.positionY
            player.positionX = startingPlayer.positionX
            player.positionY = startingPlayer.positionY
            gameOutput.text = field
            
        }
    
    }
    
    
    
    
}

protocol MethodGame {
    func NewGame(pl: PositionInRoom, bx: Box)
}

