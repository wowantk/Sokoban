//
//  BlocksModel.swift
//  Blocks 1.3
//
//  Created by mac on 28.12.2020.
//
import Foundation
import UIKit
var countOfMoves = 0
var alertCont:UIAlertController?
let textBadMove = "You cant move here"

var gameText = ""

struct Room {
    var width: Int
    var height: Int
}

var room = Room(width: 10, height: 10)

let showEmpty = "💨"
let showHero = "✈️"
let showBox = "🏃‍♂️"
let wall = "🧨"
let endGameSymb = "💰"


var field: String {
    var text = ""
    for h in 0...(room.height + 1) {
        var str = ""
        for w in 0...(room.width + 1) {
            switch(w, h) {
            case (0, _): str.append(wall)
            case(_, 0): str.append(wall)
            case (_, room.height + 1): str.append(wall)
            case(room.width + 1, _ ): str.append(wall)
            case (player.positionX, player.positionY): str.append(showHero)
            case(box.positionX, box.positionY): str.append(showBox)
            case (endGame.positionX, endGame.positionY): str.append(endGameSymb)
            default: str.append(showEmpty)
            }
        }
        text.append(str + "\n")
    }
    return text
}


class PositionInRoom {
    var positionX: Int
    var positionY: Int
    
    
    init(positionX: Int, positionY: Int) {
        self.positionX = positionX
        self.positionY = positionY
    }
}



class Box: PositionInRoom {
}

var box = Box(positionX: 2, positionY: 2)

let startingBox = Box(positionX: 2, positionY: 2)




class EndGame: PositionInRoom {
}

let endGame = EndGame(positionX: 8, positionY: 8)




var player = PositionInRoom(positionX: 1, positionY: 1)

let startingPlayer = PositionInRoom(positionX: 1, positionY: 1)


class Player {
    enum Steps {
        case left, right, down, up
        
        var stepPosition: (x: Int, y: Int) {
            switch self {
            case .left: return (-1, 0)
            case .right: return (1, 0)
            case .down: return (0, 1)
            case .up: return (0, -1)
            }
        }
    }
    
    func moveOn(go: Steps) -> String {
        
        switch (player.positionX, player.positionY, go) {
        
        case(1, _, .left): countOfMoves -= 1
            break
        case(_, 1, .up): countOfMoves -= 1
            break
        case(room.width, _, .right):countOfMoves -= 1
            break
        case(_, room.height, .down): countOfMoves -= 1
            break
           
            
        case (box.positionX, (box.positionY + 1), .up) :
            if box.positionY == 1 {
                break }

            box.positionX += go.stepPosition.x
            box.positionY += go.stepPosition.y
            player.positionX += go.stepPosition.x
            player.positionY += go.stepPosition.y
            
            


        case ((box.positionX - 1), box.positionY, .right) :
            if box.positionX == room.height { break }

            box.positionX += go.stepPosition.x
            box.positionY += go.stepPosition.y
            player.positionX += go.stepPosition.x
            player.positionY += go.stepPosition.y
            

        case ((box.positionX + 1), box.positionY, .left) :
            if box.positionX == 1 {break }

            box.positionX += go.stepPosition.x
            box.positionY += go.stepPosition.y
            player.positionX += go.stepPosition.x
            player.positionY += go.stepPosition.y
           
            


        case (box.positionX, (box.positionY - 1), .down) :
            if box.positionY == room.width { break}

            box.positionX += go.stepPosition.x
            box.positionY += go.stepPosition.y
            player.positionX += go.stepPosition.x
            player.positionY += go.stepPosition.y
            
           



        default : player.positionX += go.stepPosition.x
            player.positionY += go.stepPosition.y
        }
        
        countOfMoves += 1
        return field
    }
   
    
}
func wallAlert() -> UIAlertController {
    let controler = UIAlertController(title: "Wall", message: "You go wall", preferredStyle: .alert)
    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
    controler.addAction(action)
    return controler
    
}

var game = Player()

//game.moveOn(go: Player.Steps.down)

