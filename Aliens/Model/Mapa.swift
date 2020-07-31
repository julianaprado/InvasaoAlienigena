//
//  Mapa.swift
//  Aliens
//
//  Created by Juliana Prado on 30/07/20.
//  Copyright © 2020 Juliana Prado. All rights reserved.
//

import Foundation
import SpriteKit

class Mapa: SKNode{
    
    var mapa = SKSpriteNode()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(_ map: SKSpriteNode, _ nome: String) {
        super.init()
        mapa = map
        mapa.name = nome
        mapa.scale(to: CGSize(width: 414, height: 414))
        addChild(mapa)
    }

    func porMapa(pos: CGPoint){
        mapa.position = pos
    }
    
}
