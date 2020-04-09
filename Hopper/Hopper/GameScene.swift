//
//  GameScene.swift
//  Hopper
//
//  Created by Kelsey Sparkman on 4/8/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var greenCarConstraint: NSLayoutConstraint!
    @IBOutlet weak var redCarConstraint: NSLayoutConstraint!
    @IBOutlet weak var schoolBusConstraint: NSLayoutConstraint!
    //    @IBOutlet weak var dumpTruckConstraint: NSLayoutConstraint!
    @IBOutlet weak var pickupTruck1Constraint: NSLayoutConstraint!
    
    
    //MARK: - Properties
    var player = SKSpriteNode(imageNamed: "Abunny.5")
    var playerSize = CGSize(width: 50, height: 50)
    
    // vehicles
    var dumpTruck = SKSpriteNode(imageNamed: "dumpTruck.L")
    var greenCar = SKSpriteNode(imageNamed: "greenCarL")
    var pickupTruck1 = SKSpriteNode(imageNamed: "pickupTruck.1.R")
    
    // TODO: - Where is pickupTruck2 on the storyboard?
    //var pickupTruck2 = SKSpriteNode(imageNamed: "pickupTruck.2.R")
    var redCar = SKSpriteNode(imageNamed: "redCar.R")
    var schoolBus = SKSpriteNode(imageNamed: "schoolBus.R")
    
    // vehicle Sizes
    var dumpTruckSize = CGSize(width: 50, height: 50)
    var greenCarSize = CGSize(width: 50, height: 50)
    var pickupTruck1Size = CGSize(width: 50, height: 50)
    
    // TODO: - Where is pickupTruck2 on the storyboard?
    var pickupTruck2Size = CGSize(width: 50, height: 50)
    var redCarSize = CGSize(width: 50, height: 50)
    var schoolBusSize = CGSize(width: 50, height: 50)
    
    
    override func didMove(to view: SKView) {
        // loads rabbit with its starting conditions
        spawnPlayer()
        
        //loads vehicles
        spawnRedCar()
        spawnGreenCar()
        spawnSchoolBus()
        spawnPickupTruck1()
        spawnDumpTruck()
        
        // loads and animates vehicles
        //animateGreenCarL()
        //animateDumpTruck()
        //animatePickupTruck1()
        //animateRedCar()
        //animateSchoolBus()
        
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
    
    // Mark: - Adding nodes
    func spawnPlayer() {
        // set rabbit size
        player.size = playerSize
        // set starting position of rabbit
        player.position = CGPoint(x: self.frame.midX, y: self.frame.minY + 50)
        // add rabbit to the view
        self.addChild(player)
    }
    

    func spawnGreenCar() {
        greenCar.size = greenCarSize
        greenCar.position = CGPoint(x: self.frame.maxX + 50, y: self.frame.minY + 100)
        self.addChild(greenCar)
        let carMoveByAction = SKAction.moveBy(x: -500, y: 0, duration: 2)
        greenCar.run(carMoveByAction)
    }

    func spawnPickupTruck1() {
        pickupTruck1.size = pickupTruck1Size
        pickupTruck1.position = CGPoint(x: self.frame.minX - 50, y: self.frame.minY + 200)
        self.addChild(pickupTruck1)
        let carMoveByAction = SKAction.moveBy(x: 500, y: 0, duration: 3)
        pickupTruck1.run(carMoveByAction)
    }
    
    func spawnRedCar() {
        redCar.size = redCarSize
        redCar.position = CGPoint(x: self.frame.minX - 50, y: self.frame.minY + 300)
        self.addChild(redCar)
        let carMoveByAction = SKAction.moveBy(x: 500, y: 0, duration: 2.5)
        redCar.run(carMoveByAction)
    }
    
    func spawnSchoolBus() {
        schoolBus.size = schoolBusSize
        schoolBus.position = CGPoint(x: self.frame.minX - 50, y: self.frame.minY + 400)
        self.addChild(schoolBus)
        let carMoveByAction = SKAction.moveBy(x: 500, y: 0, duration: 2)
        schoolBus.run(carMoveByAction)
    }
    
    func spawnDumpTruck() {
        dumpTruck.size = dumpTruckSize
        dumpTruck.position = CGPoint(x: self.frame.maxX + 50, y: self.frame.minY + 500)
        self.addChild(dumpTruck)
        let carMoveByAction = SKAction.moveBy(x: -500, y: 0, duration: 1)
        dumpTruck.run(carMoveByAction)
    }

    // Mark: - Animations
//    func animateGreenCarL() {
//        greenCar.size = greenCarSize
//        self.addChild(greenCar)
//    }
    
    //        UIView.animate(withDuration: 1.0, delay: 2, options: [.repeat], animations: {
    //
    //            self.greenCarConstraint.constant -= self.view?.bounds.width ?? 500
    //            self.view?.layoutIfNeeded()
    //        }, completion: nil)
    //
    //
    //    func animateDumpTruck() {
    //        dumpTruck.size = dumpTruckSize
    //        self.addChild(dumpTruck)
    //
    //        UIView.animate(withDuration: 1.5, delay: 0, options: [.repeat, .curveEaseInOut], animations: {
    //            self.dumpTruckConstraint.constant -= self.view?.bounds.width ?? 500
    //            self.view?.layoutIfNeeded()
    //        }, completion: nil)
    //    }
    

//    func animatePickupTruck1() {
//        pickupTruck1.size = pickupTruck1Size
//        self.addChild(pickupTruck1)
//
//        UIView.animate(withDuration: 1, delay: 1, options: [.repeat, .curveLinear], animations: {
//            self.pickupTruck1Constraint.constant += self.view?.bounds.width ?? 500
//            self.view?.layoutIfNeeded()
//        }, completion: nil)
//    }
//
//    func animateRedCar() {
//        redCar.size = redCarSize
//        self.addChild(redCar)
//
//        UIView.animate(withDuration: 0.5, delay: 0.5, options: [.repeat], animations: {
//            self.redCarConstraint.constant += self.view?.bounds.width ?? 500
//            self.view?.layoutIfNeeded()
//        }, completion: nil)
//    }
//
//    func animateSchoolBus() {
//        schoolBus.size = schoolBusSize
//        self.addChild(schoolBus)
//
//        UIView.animate(withDuration: 2, delay: 1, options: [.repeat, .curveEaseOut], animations: {
//            self.schoolBusConstraint.constant += self.view?.bounds.width ?? 500
//            self.view?.layoutIfNeeded()
//        }, completion: nil)
//    }
}
