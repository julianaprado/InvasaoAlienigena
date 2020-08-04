//
//  GameScene.swift
//  Aliens
//
//  Created by Juliana Prado on 28/07/20.
//  Copyright © 2020 Juliana Prado. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    
    var player1 = telaPlayer1(SKSpriteNode(imageNamed: "brasilMapa"), "bra")
    var player2 = telaOtherPlayers(SKSpriteNode(imageNamed: "usaMapa"), "usa")
    var player3 = telaOtherPlayers(SKSpriteNode(imageNamed: "russiaMapa"), "rus")
    var mapaAtual = ""
    var nomePaises = ["bra","rus","usa"]
    var arrow1 = Arrow()
    var arrow2 = Arrow()
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        player1.mapa.position = CGPoint(x: frame.midX, y: frame.midY)
        player2.mapa.position = CGPoint(x: frame.midX, y: frame.midY + 500)
        player3.mapa.position = CGPoint(x: frame.midX + 500, y: frame.midY + 500)
        player2.mapa.zPosition = 3
        mapaAtual = player1.mapa.name!
        arrow1 = Arrow(position: CGPoint(x: frame.midX, y: frame.midY +  3*frame.midY/4), rotation: 0)
        arrow2 = Arrow(position: CGPoint(x: frame.midX + (2 * frame.midX / 3), y: frame.midY), rotation: .pi/4 * -1)
        nomearArrows()
        addChild(arrow1)
        addChild(arrow2)
        addChild(player1)
        addChild(player2)
        addChild(player3)
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let positionInScene = touch.location(in: self)
            let touchedNode = self.atPoint(positionInScene)
            if let name = touchedNode.name {
                let animacoes = actionMapa(from: mapaAtual, to: name)
                print(mapaAtual)
                print(name)
                player1.mapa.run(animacoes.player1)
                player2.mapa.run(animacoes.player2)
                player3.mapa.run(animacoes.player3)
                arrow1.arrow.run(animacoes.arrow1)
                arrow2.arrow.run(animacoes.arrow2)
                arrow1.label.run(animacoes.label1)
                arrow2.label.run(animacoes.label2)
                mapaAtual = String(name.prefix(3))
                nomearArrows()
            }
        }
    }
    
    func nomearArrows(){
        switch mapaAtual {
        case nomePaises[0]:
            arrow1.nomearArrow(nome: nomePaises[2] + "Arrow")
            arrow2.nomearArrow(nome: nomePaises[1] + "Arrow")
            break
        case nomePaises[1]:
            arrow1.nomearArrow(nome: nomePaises[2] + "Arrow")
            arrow2.nomearArrow(nome: nomePaises[0] + "Arrow")
            break
        case nomePaises[2]:
            arrow1.nomearArrow(nome: nomePaises[0] + "Arrow")
            arrow2.nomearArrow(nome: nomePaises[1] + "Arrow")
            break
        default:
            arrow1.nomearArrow(nome: "arrow1")
            arrow2.nomearArrow(nome: "arrow2")
        }
    }
    
    func actionMapa(from: String, to: String)->Actions{
       
        let rotateArrow = SKAction.rotate(byAngle: .pi , duration: 0.58)
        let reverseRotateArrow = rotateArrow.reversed()
        let rotateArrow2 =  SKAction.rotate(byAngle: .pi/4 * -1 , duration: 0.58)
        let reverseRotateArrow2 = rotateArrow2.reversed()
        let moveLabel = SKAction.move(to: CGPoint(x: frame.midX, y: frame.midY - 3*frame.midY/4 + 30), duration: 0.58)
        let moveLabelBack = SKAction.move(to: CGPoint(x: frame.midX, y: frame.midY +  3*frame.midY/4 - 50), duration: 0.58)
        let moveLabel2 = SKAction.move(to: CGPoint(x: frame.midX + (2 * frame.midX / 3), y: frame.midY - 80), duration: 0.58)
        let moveBackMap = SKAction.move(to: CGPoint(x: frame.midX, y: frame.midY), duration: 0.58)
        let moveArrow2 = SKAction.move(to: CGPoint(x: frame.midX - (2 * frame.midX / 3), y: frame.midY - 2 * (frame.midY/3)), duration: 0.58)
        
        
        
        switch from {
        case "bra":
            if to == "usaArrow"{
                
                let movePlayer1 = SKAction.moveTo(y: -500, duration: 0.58)
                let moveArrow = SKAction.move(to: CGPoint(x: frame.midX, y: frame.midY - 3*frame.midY/4), duration: 0.58)
                let group = SKAction.group([rotateArrow, moveArrow])
                let movePlayer3 = SKAction.move(to: CGPoint(x: frame.midX + 500, y: frame.midY), duration: 0.58)
                return Actions(player1: movePlayer1, player2: moveBackMap, player3: movePlayer3, arrow1: group, arrow2: rotateArrow2, label1: moveLabel, label2: moveLabel2)
                
            } else {//russia
               
                let movePlayer1 = SKAction.move(to: CGPoint(x: frame.midX - 500, y: frame.midY - 500), duration: 0.58)
                let movePlayer2 = SKAction.move(to: CGPoint(x: frame.midX, y: frame.midY + 500), duration: 0.58)
                let group = SKAction.group([rotateArrow, moveArrow2])
                let rotateArrow1 =  SKAction.rotate(byAngle: .pi/2 , duration: 0.58)
                let moveArrow1 = SKAction.move(to: CGPoint(x: frame.midX - (2 * frame.midX / 3), y: frame.midY + 60), duration: 0.58)
                let group1 = SKAction.group([rotateArrow1, moveArrow1])
                let moveLabel1 = SKAction.move(to: CGPoint(x: frame.midX - (2 * frame.midX / 3) + 80, y: frame.midY + 60), duration: 0.58)
                let moveLabel2 = SKAction.move(to: CGPoint(x: frame.midX - (2 * frame.midX / 3) + 80, y: frame.midY - 2 * (frame.midY/3)), duration: 0.58)
                return Actions(player1: movePlayer1, player2: movePlayer2, player3: moveBackMap, arrow1: group1, arrow2: group, label1: moveLabel1, label2: moveLabel2)
            }
        case "usa":
            if to == "braArrow"{
                let movePlayer2 = SKAction.move(to: CGPoint(x: frame.midX, y: frame.midY + 500), duration: 0.58)
                let moveArrowBack = SKAction.move(to: CGPoint(x: frame.midX, y: frame.midY +  3*frame.midY/4), duration: 0.58)
                let group = SKAction.group([reverseRotateArrow, moveArrowBack])
                let movePlayer3 = SKAction.move(to: CGPoint(x: frame.midX + 500, y: frame.midY + 500), duration: 0.58)
                return Actions(player1: moveBackMap, player2: movePlayer2, player3: movePlayer3, arrow1: group, arrow2: reverseRotateArrow2, label1: moveLabelBack, label2: moveLabel2)
            } else { //russia
                let movePlayer1 = SKAction.move(to: CGPoint(x: frame.midX - 500, y: frame.midY), duration: 0.58)
                let movePlayer2 = SKAction.move(to: CGPoint(x: frame.midX, y: frame.midY + 500), duration: 0.58)
                let rotateArrow2 =  SKAction.rotate(byAngle: .pi/6 * -1, duration: 0.58)
                let group = SKAction.group([rotateArrow2, moveArrow2])
                let moveLabel1 = SKAction.move(to: CGPoint(x: frame.midX - (2 * frame.midX / 3) + 80, y: frame.midY + 60), duration: 0.58)
                let moveLabel2 = SKAction.move(to: CGPoint(x: frame.midX - (2 * frame.midX / 3) + 80, y: frame.midY - 2 * (frame.midY/3)), duration: 0.58)
                let moveArrow1 = SKAction.move(to: CGPoint(x: frame.midX - (2 * frame.midX / 3), y: frame.midY + 60), duration: 0.58)
                let group1 = SKAction.group([rotateArrow, moveArrow1])
                return Actions(player1: movePlayer1, player2: movePlayer2, player3: moveBackMap, arrow1: group, arrow2: group1, label1: moveLabel1, label2: moveLabel2)
            }
        case "rus":
            if to == "usaArrow"{
                let movePlayer1 = SKAction.move(to: CGPoint(x: frame.midX, y: frame.midY + 500), duration: 0.58)
                let movePlayer2 = SKAction.move(to: CGPoint(x: frame.midX - 500, y: frame.midY), duration: 0.58)
                let rotateArrow2 =  SKAction.rotate(byAngle: .pi/6 * -1, duration: 0.58)
                let moveBackArrow = SKAction.move(to: CGPoint(x: frame.midX + (2 * frame.midX / 3), y: frame.midY), duration: 0.58)
                let group = SKAction.group([rotateArrow2.reversed(), moveBackArrow])
                let moveLabel1 = SKAction.move(to: CGPoint(x: frame.midX - (2 * frame.midX / 3) + 80, y: frame.midY + 60), duration: 0.58)
                let moveLabel2 = SKAction.move(to: CGPoint(x: frame.midX - (2 * frame.midX / 3) + 80, y: frame.midY - 2 * (frame.midY/3)), duration: 0.58)
                let moveArrow1 = SKAction.move(to: CGPoint(x: frame.midX - (2 * frame.midX / 3), y: frame.midY + 60), duration: 0.58)
                let group1 = SKAction.group([rotateArrow, moveArrow1])
                return Actions(player1: movePlayer1, player2: movePlayer2, player3: moveBackMap, arrow1: group, arrow2: group1, label1: moveLabel1, label2: moveLabel2)
            } else { //brasil
                
                
                
                
                
            }
        default:
            print("Mapa não encontrado.")
        }
        
        
        return Actions(player1: SKAction.rotate(byAngle: .pi/4 * -1 , duration: 0.58), player2: SKAction.rotate(byAngle: .pi/4 * -1 , duration: 0.58), player3: SKAction.rotate(byAngle: .pi/4 * -1 , duration: 0.58), arrow1: SKAction.rotate(byAngle: .pi/4 * -1 , duration: 0.58), arrow2: SKAction.rotate(byAngle: .pi/4 * -1 , duration: 0.58), label1: SKAction.rotate(byAngle: .pi/4 * -1 , duration: 0.58), label2: SKAction.rotate(byAngle: .pi/4 * -1 , duration: 0.58))
    }
}
