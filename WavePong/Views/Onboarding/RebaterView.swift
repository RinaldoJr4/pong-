//
//  RebaterView.swift
//  WavePong
//
//  Created by rsbj on 14/08/23.
//

import SwiftUI

struct RebaterView: View {
    
    @State var bola = false
    
    var body: some View {
        ZStack{
            
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .accessibilityHidden(true)
            
            VStack{
                Spacer()
                    .frame(height: 64)
                
                Spacer()
                
                Text("Ao \(Text("rebater").foregroundColor(Color(ColorConstants.shared.YELLOW_600))) a bola haverá uma \(Text("vibração").foregroundColor(Color(ColorConstants.shared.YELLOW_600)))")
                    .font(.custom("DaysOne-Regular", size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(Color(ColorConstants.shared.WHITE_500))
                    .multilineTextAlignment(.center)
                    .frame(width: 310, height: 270, alignment: .center)
                    .accessibilityHint("Toque duas vezes na tela para continuar")
                Spacer()
                
                VStack {
                    
                    Image("Ball")
                        .rotationEffect(Angle(degrees: 250))
                        .foregroundColor(Color(ColorConstants.shared.YELLOW_600))
                        .offset(x: bola ? 100: 40, y: bola ? 0 : 100)
                        .animation(.easeOut(duration: 2).repeatForever(autoreverses: false),value: bola)
                        .accessibilityHidden(true)
                    Image("raquete")
                        .frame(width: 145, height: 33, alignment: .center)
                        .padding(20)
                        .accessibilityHidden(true)
                        .onAppear{
                            bola = true
                        }
                }
                Spacer()
            }
        }
    }
}

struct RebaterView_Previews: PreviewProvider {
    static var previews: some View {
        RebaterView()
    }
}
