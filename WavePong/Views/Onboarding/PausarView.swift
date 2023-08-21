//
//  PausarView.swift
//  WavePong
//
//  Created by rsbj on 14/08/23.
//

import SwiftUI

struct PausarView: View {
    @State var scale: CGFloat = 1.0
    @State var animation = false
    
    var body: some View {
        ZStack{
            
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .accessibilityHidden(true)
            
            VStack(alignment: .center, spacing: 60 ){
                Text("Dê \(Text("Dois toques").foregroundColor(.yellow)) na tela para \(Text("pausar").foregroundColor(.yellow)) o jogo")
                    .font(.custom("DaysOne-Regular", size: 35))
                    .foregroundColor(.white)
                    .bold()
                    .minimumScaleFactor(15)
                    .multilineTextAlignment(.center)
                    .padding(40)
                
                HStack{
                    Image(systemName: "circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .center)
                        .padding(10)
                        .blur(radius: scale, opaque: false)
                        .foregroundColor(.yellow)
                        .accessibilityHidden(true)
                        .overlay(
                            ZStack{
                                Circle()
                                    .stroke(Color.yellow)
                                    .frame(width: 100, height: 100)
                                    .blur(radius: scale)
                                    .scaleEffect(scale)
                                    .opacity(Double(2 - scale))
                                    .animation(.easeOut(duration: 3).repeatForever(autoreverses: false), value: animation)
                                Circle()
                                    .stroke(Color.yellow)
                                    .frame(width: 100, height: 100)
                                    .blur(radius: scale)
                                    .scaleEffect(scale - 0.5)
                                    .opacity(Double(2 - scale))
                                    .animation(.easeOut(duration: 3).repeatForever(autoreverses: false), value: animation)
                            }
                        )
                        .accessibilityHidden(true)
                        .onAppear{
                            scale += 1
                            animation = true
                        }
                }
            }
        }
    }
}

struct PausarView_Previews: PreviewProvider {
    static var previews: some View {
        PausarView()
    }
}