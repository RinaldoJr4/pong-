//
//  GameScene.swift
//  WavePong
//
//  Created by Lucas Migge on 28/07/23.
//

import Foundation
import SpriteKit
import UIKit
import SwiftUI


class GameScene: SKScene {
   
    var soundManager = SoundManager.shared
    var gameManager = GameManager()
    var ball: Ball!
    var paddle: Paddle!
    var cloud: SKSpriteNode!
   
    
    override func didMove(to view: SKView) {
        setupGameManager()
        setupWorld()
        setupComponents()
        startGame()
    }
    
    func viewWillDisappear() {
        isPaused = true
        soundManager.stopGameTheme()
    }

    func startGame(){
        ball.run(SKAction.applyImpulse(createRandomVector(), duration: 1))
        cloud.run(SKAction.move(to: CGPoint(x: self.frame.midX, y: self.frame.midY + 100), duration: 20))
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        soundManager.updateAudioOrientation(ballPosition: ball.position, frameSize: frame.size)
    }
    
    private func createRandomVector() -> CGVector {
        let startAtRightOrientation = Bool.random()
        let randomX = Double.random(in: 4...10)
        
        var vectorX: Double = 0
        
        if startAtRightOrientation {
            vectorX = randomX
        } else {
            vectorX = randomX * -1
        }
        
        return CGVector(dx: vectorX, dy: 15)
    }
        
}

extension GameScene: GameSceneProtocol {
    func didUserScored(newScore score: Int) {
        backgroundColor = gameManager.colors[Int.random(in: 0..<3)]
    }
    
    func gameOver() {
        isPaused = true
    }
    
}


