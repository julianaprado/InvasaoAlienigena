//
//  telaPlayer1.swift
//  Aliens
//
//  Created by Juliana Prado on 28/07/20.
//  Copyright © 2020 Juliana Prado. All rights reserved.
//

import Foundation
import SpriteKit

class telaPlayer1:telaOtherPlayers{


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(_ map: SKSpriteNode, _ nome: String) {
        super.init(map, nome)
    }
    
    
}
