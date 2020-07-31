//
//  GameViewController.swift
//  Aliens
//
//  Created by Juliana Prado on 28/07/20.
//  Copyright © 2020 Juliana Prado. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {  super.viewDidLoad()
          let scene = GameScene(size: view.bounds.size)
          let skView = view as! SKView
          skView.showsFPS = true
          skView.showsNodeCount = true
          skView.ignoresSiblingOrder = true
          scene.scaleMode = .resizeFill
          skView.presentScene(scene)

    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    
}
