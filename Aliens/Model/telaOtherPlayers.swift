//
//  telaOtherPlayers.swift
//  Aliens
//
//  Created by Juliana Prado on 28/07/20.
//  Copyright © 2020 Juliana Prado. All rights reserved.
//

import Foundation
import SpriteKit

class telaOtherPlayers:SKNode{
    
    var mapa = Mapa(SKSpriteNode(imageNamed: "brasilMapa"), "brasil")


    
    init(_ map: SKSpriteNode, _ nomeMapa: String) {
        super.init()
        mapa = Mapa(map, nomeMapa)
        mapa.name = nomeMapa
        addChild(mapa)

    }
    
   
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


}
