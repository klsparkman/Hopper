//
//  GameScene.swift
//  Hopper
//
//  Created by Kelsey Sparkman on 4/8/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //MARK: - Properties
    let backGroundColor = UIColor.green
    
    let player = SKSpriteNode(imageNamed: <#T##String#>)
//    let playerColor = UIColor.white
    var playerSize = CGSize(width: 50, height: 50)
    
    
    override func didMove(to view: SKView) {
        self.backgroundColor = backgroundColor
        spawnPlayer()
        
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        for t in touches {
//
//        }
//    }
    
    func spawnPlayer() {
        // give player size and color
        player.position = CGPoint(x: self.frame.midX, y: 25)
        self.addChild(player)
    }
    
//    override func update(_ currentTime: TimeInterval) {
//        // Called before each frame is rendered
//    }
}
