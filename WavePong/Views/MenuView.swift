//
//  MenuView.swift
//  WavePong
//
//  Created by rsbj on 04/08/23.
//

import SwiftUI


struct MenuView: View {
    
    
    var body: some View {
        GeometryReader{ geo in
            ZStack {
                Image("backgroundGame")
                    .resizable()
                    .ignoresSafeArea()
                    .accessibilityHidden(true)
                VStack() {
                    Image("Wave-pong")
                        .accessibilityHidden(true)
                    Spacer().frame(height: 192)
                    NavigationLink(destination: {
//                        GameSceneView()
                        CountDownView()
                            .navigationBarBackButtonHidden()
                    }) {
//                        LabelButton(buttonStyle: .start, buttonAction:{})
                        Text("game")
                    }
                    .foregroundColor(.yellow)
                    .accessibilityLabel("começar")
                    Spacer().frame(height: 48)
                    HStack {
                        NavigationLink(destination: {
                            ConfigurationView()
                        }) {
                            IconButton(.settings, buttonAction: {})
                        }
                            .foregroundColor(.yellow)
                            .accessibilityLabel("Configurações")
                            .padding(.trailing,48)
                        NavigationLink(destination: {
                            SoundBoardView()
                        }) {
                            IconButton(.gamecenter, buttonAction: {})
                        }
                            .foregroundColor(.yellow)
                            .accessibilityLabel("game center")
                    }
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
