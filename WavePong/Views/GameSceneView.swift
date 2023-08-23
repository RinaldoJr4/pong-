//
//  GameSceneView.swift
//  WavePong
//
//  Created by Lucas Migge on 08/08/23.
//

import SwiftUI
import SpriteKit


struct GameSceneView: View {
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var viewModel: GameSceneViewModel = GameSceneViewModel.shared
    
    @State var allowInteraction = true
    
    var gameScene: GameScene {
        let scene = GameScene(size: viewModel.size,
                              gameManager: viewModel.gameManager)
        scene.scaleMode = .fill
        
        return scene
    }
    
    var acessbility: Bool {
        if viewModel.state == .game {
            return false
        } else {
            return true
        }
    }
    struct CustomModifier: ViewModifier {
        var condition: Bool
        
        func body(content: Content) -> some View {
            if condition { // assuming you have a condition here
                return content
                    .accessibilityAddTraits(.allowsDirectInteraction)
            } else {
                return content
                    .accessibilityRemoveTraits(.allowsDirectInteraction)
            }
        }
    }
    
    
    var body: some View {
        GeometryReader{ geo in
            
            ZStack {
                gameView
                    .ignoresSafeArea()
                    .accessibilityElement()
                    .modifier(CustomModifier(condition: acessbility))
                    .onAppear(){
                        viewModel.size = geo.size
                    }
                    .overlay {
                        if viewModel.state == .gameOver {
                            gameOverView
                        } else if viewModel.state == .pause {
                            pauseView
                        }
                        
                    }
            }
            
        }
        
        
    }
    
    private var gameView: some View {
        SpriteView(scene: self.gameScene)
            .ignoresSafeArea()
        
    }
    
    private var backgroundImageView: some View {
        Image("backgroundGame")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .accessibilityHidden(true)
    }
    
    private func startGame() {
        gameScene.startGame()
    }
    
    private var gameOverView: some View {
        ZStack {
            backgroundImageView
            
            VStack(spacing: 48) {
                VStack(spacing: 16) {
                    Image("Game-over")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 208, height: 133)
                        .accessibilityHidden(true)
                    
                    Text(viewModel.recordLabel)
                        .font(Font.wavePongPrimary(.body))
                        .foregroundColor(Color(ColorConstants.AMARELO))
                        .accessibilityLabel("\(viewModel.recordLabel) pontos")
                    
                    
                }
                
                VStack(spacing: -16) {
                    Text(viewModel.userScore)
                        .font(Font.wavePongSecundary(.scoreNumber))
                        .accessibilityLabel("Você fez \(viewModel.userScore) pontos")
                    
                    
                    Text("Pontos")
                        .font(Font.wavePongPrimary(.body))
                        .accessibilityHidden(true)
                    
                }
                .foregroundColor(Color(ColorConstants.WHITE))
                
                HStack {
                    HStack(spacing: 48)  {
                        IconButton(.home) {
                            viewModel.homeButtonPressed()
                            presentation.wrappedValue.dismiss()
                        }
                        .accessibilityLabel(Text("Voltar para menu"))
                        
                        IconButton(.refresh) {
                            viewModel.refreshPressed()
                        }
                        .accessibilityLabel(Text("Reiniciar"))
                    }
                    
                }
            }
        }
    }
    
    private var pauseView: some View {
        ZStack {
            backgroundImageView
            
            VStack(spacing: 48) {
                
                Image("PauseLabel")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 253, height: 140)
                    .accessibilityHidden(true)
                
                
                LabelButton(buttonStyle: .resume) {
                    viewModel.continueButtonPressed()
                }
                .accessibilityLabel(Text("Continuar"))
                
                
                HStack(spacing: 48)  {
                    IconButton(.home) {
                        presentation.wrappedValue.dismiss()
                        viewModel.homeButtonPressed()
                    }
                    .accessibilityLabel(Text("Voltar para menu"))
                    
                    IconButton(.refresh) {
                        viewModel.refreshPressed()
                    }
                    .accessibilityLabel(Text("Reiniciar"))
                }
            }
        }
        
    }
    
    
}




struct GameSceneView_Previews: PreviewProvider {
    static var previews: some View {
        GameSceneView()
    }
}
