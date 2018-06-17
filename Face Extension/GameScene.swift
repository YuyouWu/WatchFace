//
//  GameScene.swift
//  WatchFace Extension
//
//  Created by Yuyou Wu on 6/16/18.
//  Copyright © 2018 Yuyou Wu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var secondHand:SKSpriteNode = SKSpriteNode()
    var minuteHand:SKSpriteNode = SKSpriteNode()
    var hourHand:SKSpriteNode = SKSpriteNode()
    private var spinnyNode : SKShapeNode?
    
    override func sceneDidLoad() {
        let secHand:SKSpriteNode = self.childNode(withName: "SecondHand") as! SKSpriteNode
        let minHand:SKSpriteNode = self.childNode(withName: "MinuteHand") as! SKSpriteNode
        let hrHand:SKSpriteNode = self.childNode(withName: "HourHand") as! SKSpriteNode
        secondHand = secHand
        minuteHand = minHand
        hourHand = hrHand
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        let date = Date()
        let calendar = Calendar.current
        let hour = CGFloat(calendar.component(.hour, from: date))
        let minutes = CGFloat(calendar.component(.minute, from: date))
        let seconds = CGFloat(calendar.component(.second, from: date))
        secondHand.zRotation = -1 * deg2rad(seconds * 6)
        minuteHand.zRotation = -1 * deg2rad(minutes * 6)
        hourHand.zRotation = -1 * deg2rad(hour * 30 + minutes/2)
    }
    
    func deg2rad(_ number: CGFloat) -> CGFloat {
        return number * .pi / 180
    }
}
