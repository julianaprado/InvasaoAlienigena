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
        arrow.scale(to: CGSize(width: 100, height: 100))
        arrow.zPosition = 4
        addChild(arrow)
        addChild(label)
    }
    

    
    func nomearArrow(nome: String){
        arrow.name = nome
        label.text = nome
    }
    
    func setPositionArrow(_ posicaoXY: CGPoint){
        arrow.position = posicaoXY
    }
    
    func setZRotation(rotacao: CGFloat){
        arrow.zRotation = .pi/4 * -1
    }
    
}
