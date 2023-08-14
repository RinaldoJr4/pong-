//
//  GameSceneProtocol.swift
//  WavePong
//
//  Created by Lucas Migge on 05/08/23.
//

import Foundation

/// Protocol for updating game scene from triggers of game logic
///
/// This interface allows the game logic to inform scene for needed updates of it's state
protocol GameSceneDelegate {
    
    /// Once player scored, the methods should be used by the game scene to inform user
    func UserScored(newScore score: Int)
    
    /// Once game is over, this methods should be used by the game scene change it's state
    func gameOver()
    
    /// Once game is paused, this methods should be used by the game scene change it's state
    func pausePressed()
    
}
