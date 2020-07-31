//
//  GameScene.swift
//  Aliens
//
//  Created by Juliana Prado on 28/07/20.
//  Copyright © 2020 Juliana Prado. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    
    var player1 = telaPlayer1(SKSpriteNode(imageNamed: "brasilMapa"), "brasil")
    var player2 = telaOtherPlayers(SKSpriteNode(imageNamed: "russiaMapa"), "russia")
    var mapaAtual = ""
    var nomePaises = ["brasil","russia","eua"]
    var arrow1 = Arrow()
    var arrow2 = Arrow()
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        player1.mapa.position = CGPoint(x: frame.midX, y: frame.midY)
        player2.mapa.position = CGPoint(x: frame.midX, y: frame.midY + 500)
        player2.mapa.zPosition = 3
        mapaAtual = player1.mapa.name!
        addChild(player1)
        addChild(player2)
        setupArrows()
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let positionInScene = touch.location(in: self)
            let touchedNode = self.atPoint(positionInScene)
            if let name = touchedNode.name {
                print(name)
                if name == "russiaArrow" {
                    mapaAtual = "russia"
                    let movePlayer2 = SKAction.move(to: CGPoint(x: frame.midX, y: frame.midY), duration: 0.58)
                    player2.mapa.run(movePlayer2)
                    let movePlayer1 = SKAction.moveTo(y: -500, duration: 0.58)
                    player1.mapa.run(movePlayer1)
                    nomearArrows()
                } else if name == "brasilArrow"{
                    mapaAtual = "brasil"
                    let movePlayer1 = SKAction.move(to: CGPoint(x: frame.midX, y: frame.midY), duration: 0.58)
                    player1.mapa.run(movePlayer1)
                    let movePlayer2 = SKAction.move(to: CGPoint(x: frame.midX, y: frame.midY + 500), duration: 0.58)
                    player2.mapa.run(movePlayer2)
                    nomearArrows()
                }
            }
        }
    }
    
    func setupArrows(){
        nomearArrows()
        arrow1.position = CGPoint(x: frame.midX, y: frame.midY +  60)
        arrow2.position = CGPoint(x: frame.midX + 300, y: frame.midY)
        arrow1.label.position = CGPoint(x: frame.midX, y: frame.midY)
        arrow2.label.position = CGPoint(x: frame.midX + 300, y: frame.midY)
        addChild(arrow1)
        addChild(arrow2)
    }
    
    
    func nomearArrows(){
        switch mapaAtual {
        case nomePaises[0]:
            arrow1.nomearArrow(nome: nomePaises[1] + "Arrow")
            arrow2.nomearArrow(nome: nomePaises[2] + "Arrow")
            break
        case nomePaises[1]:
            arrow1.nomearArrow(nome: nomePaises[0] + "Arrow")
            arrow2.nomearArrow(nome: nomePaises[2] + "Arrow")
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
}
