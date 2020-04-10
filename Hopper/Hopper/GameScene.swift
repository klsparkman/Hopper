import SpriteKit
import GameplayKit
import UIKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //MARK: - Properties
    var label = SKLabelNode(text: "Hop to it!")
    var carrot = SKSpriteNode(imageNamed: "carrot")
    var player = SKSpriteNode(imageNamed: "Abunny.5")
    
    // vehicles
    var dumpTruck = SKSpriteNode(imageNamed: "dumpTruck.L")
    var greenCar = SKSpriteNode(imageNamed: "greenCarL")
    var pickupTruck1 = SKSpriteNode(imageNamed: "pickupTruck.1.R")
    var redCar = SKSpriteNode(imageNamed: "redCar.R")
    var schoolBus = SKSpriteNode(imageNamed: "schoolBus.R")
    
    // Sizes
    var playerSize = CGSize(width: 40, height: 40)
    var dumpTruckSize = CGSize(width: 50, height: 50)
    var greenCarSize = CGSize(width: 50, height: 50)
    var pickupTruck1Size = CGSize(width: 50, height: 50)
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
        spawnCarrot()
        spawnLabel()
        
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
    
    func spawnCarrot() {
        carrot.size = CGSize(width: 60, height: 60)
        carrot.position = CGPoint(x: self.frame.midX, y: 750)
        self.addChild(carrot)
    }
    
    func spawnLabel() {
        label.position = CGPoint(x: self.frame.midX, y: 800)
        label.fontColor = UIColor.black
        self.addChild(label)
    }
    
    // greenCar stuff
    func spawnGreenCar() {
        greenCar.size = greenCarSize
        greenCar.position = CGPoint(x: self.frame.maxX + 50, y: self.frame.minY + 100)
        self.addChild(greenCar)
        
        greenCar.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(greenCarEndlessAnimation), SKAction.wait(forDuration: 1.0)])))
    }
    
    func greenCarEndlessAnimation() {
        greenCar.position = CGPoint(x: self.frame.maxX + 50, y: self.frame.minY + 100)
        let carMoveByAction = SKAction.moveBy(x: -500, y: 0, duration: 2)
        greenCar.run(carMoveByAction)
    }
    
    // pickupTruck1 stuff
    func spawnPickupTruck1() {
        pickupTruck1.size = pickupTruck1Size
        pickupTruck1.position = CGPoint(x: self.frame.minX - 50, y: self.frame.minY + 600)
        self.addChild(pickupTruck1)
        
        pickupTruck1.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(pickupTruck1EndlessAnimation), SKAction.wait(forDuration: 2.5)])))
    }
    
    func pickupTruck1EndlessAnimation() {
        pickupTruck1.position = CGPoint(x: self.frame.minX - 50, y: self.frame.minY + 600)
        let carMoveByAction = SKAction.moveBy(x: 500, y: 0, duration: 3)
        pickupTruck1.run(carMoveByAction)
    }
    
    // redCar stuff
    func spawnRedCar() {
        redCar.size = redCarSize
        redCar.position = CGPoint(x: self.frame.minX - 50, y: self.frame.minY + 300)
        self.addChild(redCar)
        
        redCar.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(redCarEndlessAnimation), SKAction.wait(forDuration: 2.5)])))
    }
    
    func redCarEndlessAnimation() {
        redCar.position = CGPoint(x: self.frame.minX - 50, y: self.frame.minY + 250)
        let carMoveByAction = SKAction.moveBy(x: 500, y: 0, duration: 2.5)
        redCar.run(carMoveByAction)
    }
    
    // schoolBus stuff
    func spawnSchoolBus() {
        schoolBus.size = schoolBusSize
        schoolBus.position = CGPoint(x: self.frame.minX - 50, y: self.frame.minY + 400)
        self.addChild(schoolBus)
        
        schoolBus.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(schoolBusEndlessAnimation), SKAction.wait(forDuration: 1.5)])))
    }
    
    func schoolBusEndlessAnimation() {
        schoolBus.position = CGPoint(x: self.frame.minX - 50, y: self.frame.minY + 400)
        let carMoveByAction = SKAction.moveBy(x: 500, y: 0, duration: 3)
        schoolBus.run(carMoveByAction)
    }
    
    // dumpTruck stuff
    func spawnDumpTruck() {
        dumpTruck.size = dumpTruckSize
        dumpTruck.position = CGPoint(x: self.frame.maxX + 50, y: 500)
        self.addChild(dumpTruck)
        
        dumpTruck.run(SKAction.repeatForever(SKAction.sequence([SKAction.run(dumpTruckEndlessAnimation), SKAction.wait(forDuration: 0.9)])))
    }
    
    func dumpTruckEndlessAnimation() {
        dumpTruck.position = CGPoint(x: self.frame.maxX + 50, y: 500)
        let carMoveByAction = SKAction.moveBy(x: -500, y: 0, duration: 4)
        dumpTruck.run(carMoveByAction)
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        if self.player.intersects(self.greenCar) {
            player.position = CGPoint(x: self.frame.midX, y: self.frame.minY + 50)
        }
        if self.player.intersects(self.dumpTruck) {
            player.position = CGPoint(x: self.frame.midX, y: self.frame.minY + 50)
        }
        if self.player.intersects(self.pickupTruck1) {
            player.position = CGPoint(x: self.frame.midX, y: self.frame.minY + 50)
        }
        if self.player.intersects(self.redCar) {
            player.position = CGPoint(x: self.frame.midX, y: self.frame.minY + 50)
        }
        if self.player.intersects(self.schoolBus) {
            player.position = CGPoint(x: self.frame.midX, y: self.frame.minY + 50)
        }
        if self.player.intersects(self.carrot) {
            label.text = "You did it, you winner, you!"
        }
    }
}
