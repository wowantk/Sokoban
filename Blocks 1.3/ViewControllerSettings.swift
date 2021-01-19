//
//  ViewControllerSettings.swift
//  Blocks 1.3
//
//  Created by macbook on 30.12.2020.
//

import UIKit

class ViewControllerSettings: UIViewController {
    @IBOutlet weak var personX: UITextField!
    
    @IBOutlet weak var personY: UITextField!
    
    @IBOutlet weak var boxX: UITextField!
    @IBOutlet weak var boxY: UITextField!
    @IBOutlet weak var targetX: UITextField!
    @IBOutlet weak var targetY: UITextField!
     var delegate:MethodGame?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button(_ sender: Any) {
        let pX = Int(personX.text! ) ?? 0
        let pY = Int(personY.text! ) ?? 0
        let bX = Int(boxX.text! ) ?? 0
        let bY = Int(boxY.text! ) ?? 0
        let tX = Int(targetX.text!) ?? 0
        let tY = Int(targetY.text!) ?? 0
        
        if pX == 0 && pY == 0 && bX == 0 && bY == 0 && tX == 0 && tY == 0 {
            let controler = UIAlertController(title: "Error", message: "You set bad data", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            controler.addAction(action)
            self.present(controler, animated: true, completion: nil)
        }
        
        let  pl = PositionInRoom(positionX: pX, positionY: pY)
        let  bx = Box(positionX: bX, positionY: bY)
        endGame.positionX = tX
        endGame.positionY = tY
        delegate?.NewGame(pl: pl, bx: bx)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}