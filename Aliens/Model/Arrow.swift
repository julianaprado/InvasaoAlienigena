//
//  Arrow.swift
//  Aliens
//
//  Created by Juliana Prado on 29/07/20.
//  Copyright © 2020 Juliana Prado. All rights reserved.
//

import Foundation
import SpriteKit

class Arrow:SKNode{
    
    var arrow = SKSpriteNode(imageNamed: "arrow")
    var label = SKLabelNode()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        arrow.scale(to: CGSize(width: 70, height: 70))
        arrow.zPosition = 4
        label.zPosition = 7
        label.color = .red
        label.fontColor = .red
        addChild(arrow)
        addChild(label)
    }
    
    convenience init(position: CGPoint, rotation: CGFloat){
        self.init()
        arrow.position = position
        label.position = CGPoint(x: position.x, y: position.y - 50)
        self.setZRotation(rotacao: rotation)
    }
    
    func nomearArrow(nome: String){
        arrow.name = nome
        label.text = nome
    }
    
    func setPositionArrow(_ posicaoXY: CGPoint){
        arrow.position = posicaoXY
    }
    
    func setZRotation(rotacao: CGFloat){
        arrow.zRotation = rotacao
    }
    
}
