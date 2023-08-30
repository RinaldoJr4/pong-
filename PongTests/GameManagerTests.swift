//
//  GameManagerTests.swift
//  PongTests
//
//  Created by Lucas Migge on 29/08/23.
//

@testable import Pong
import XCTest

final class GameManagerTests: XCTestCase {
    
    var playerMock: PlayerProtocol!
    var soundManagerMock: SoundManagerProtocol!
    var gameManager: GameManagerProtocol!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        playerMock = Player(defaults: UserDefaultsMock())
        soundManagerMock = SoundManagerMock(player: playerMock)
        
        gameManager = GameManager(
            soundManager: soundManagerMock,
//            hapticsManager: ,
            player: playerMock)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
