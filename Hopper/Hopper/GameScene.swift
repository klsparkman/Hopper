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
    var player = SKSpriteNode(imageNamed: "Abunny.5")

    var dumpTruck = SKSpriteNode(imageNamed: "dumpTruck.L")
    var greenCar = SKSpriteNode(imageNamed: "greenCar.L")
    var pickupTruck1 = SKSpriteNode(imageNamed: "pickupTruck.1.R")
    var pickupTruck2 = SKSpriteNode(imageNamed: "pickupTruck.2.R")
    var redCar = SKSpriteNode(imageNamed: "redCar.R")
    var schoolBus = SKSpriteNode(imageNamed: "schoolBus.R")
    
//    let playerColor = UIColor.white
  
    var playerSize = CGSize(width: 50, height: 50)
    var dumpTruckSize = CGSize(width: 50, height: 50)
    var greenCarSize = CGSize(width: 50, height: 50)
    var pickupTruck1Size = CGSize(width: 50, height: 50)
    var pickupTruck2Size = CGSize(width: 50, height: 50)
    var redCarSize = CGSize(width: 50, height: 50)
    var schoolBusSize = CGSize(width: 50, height: 50)

    
    override func didMove(to view: SKView) {
        // loads rabbit with its starting conditions
        spawnPlayer()
        
        // sets up tap recognizer to listen for the tap function
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(recognizer)
    }
    
    @objc func tap(recognizer: UIGestureRecognizer) {
        // gets the exact point on the screen where the user tapped
        let viewLocation = recognizer.location(in: view)
        let sceneLocation = convertPoint(fromView: viewLocation)
        
        // defines which direction to move, how far, and how quickly
        if player.position.y < sceneLocation.y {
            let moveByAction = SKAction.moveBy(x: 0, y: 50, duration: 0.3)
            player.run(moveByAction)
        } else {
            let moveByAction = SKAction.moveBy(x: 0, y: -50, duration: 0.3)
            
            // executes the movement action
            player.run(moveByAction)
        }
    }
    
    func spawnPlayer() {
        // set rabbit size
        player.size = playerSize
        
        // set starting position of rabbit
        player.position = CGPoint(x: self.frame.midX, y: self.frame.minY + 50)
        
        // add rabbit to the view
        self.addChild(player)
    }

    var hitBunny: [SKSpriteNode] = []
    override func enumerateChildNodes(withName name: bunny, using block: @escaping (SKNode, UnsafeMutablePointer<ObjCBool>) -> Void) {
        <#code#>
    }
    
//    override func update(_ currentTime: TimeInterval) {
//        // Called before each frame is rendered
//    }
}
