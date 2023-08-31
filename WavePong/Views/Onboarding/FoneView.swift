//
//  FoneView.swift
//  WavePong
//
//  Created by rsbj on 14/08/23.
//

import SwiftUI

struct FoneView: View {
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .accessibilityHidden(true)
            
            VStack{
                Text("\(Text("Coloque").foregroundColor(.yellow)) o \(Text("fone").foregroundColor(.yellow)) de ouvido, depois \(Text("toque").foregroundColor(.yellow)) na tela para continuar").font(.custom("DaysOne-Regular", size: 35))
                    .foregroundColor(.white)
                    .bold()
                    .minimumScaleFactor(0.1)
                    .multilineTextAlignment(.center)
                    .padding(40)
                    .padding()
                    .accessibilityHint("Toque duas vezes na tela para continuar")
                
                Image("fone")
                    .accessibilityHidden(true)
            }
        }
    }
}

struct FoneView_Previews: PreviewProvider {
    static var previews: some View {
        FoneView()
    }
}
