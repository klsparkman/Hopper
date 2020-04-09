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
    var player = SKSpriteNode(imageNamed: "Necrospect")
//    let playerColor = UIColor.white
    var playerSize = CGSize(width: 50, height: 50)
    
    override func didMove(to view: SKView) {
        spawnPlayer()
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(recognizer)
    }
    
    @objc func tap(recognizer: UIGestureRecognizer) {
        let viewLocation = recognizer.location(in: view)
        let sceneLocation = convertPoint(fromView: viewLocation)
        if player.position.y < sceneLocation.y {
            let moveByAction = SKAction.moveBy(x: 0, y: 50, duration: 0.3)
            player.run(moveByAction)
        } else {
            let moveByAction = SKAction.moveBy(x: 0, y: -50, duration: 0.3)
            player.run(moveByAction)
        }
    }
    
    func spawnPlayer() {
        // give player size and color
        player.size = playerSize
        player.position = CGPoint(x: self.frame.midX, y: self.frame.minY + 50)
        self.addChild(player)
    }
    
//    override func update(_ currentTime: TimeInterval) {
//        // Called before each frame is rendered
//    }
}
