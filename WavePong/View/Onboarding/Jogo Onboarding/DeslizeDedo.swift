//
//  BolaGuiada.swift
//  DvdScreensaver
//
//  Created by Mariane Vilarim on 28/10/22.
//

import SwiftUI
import AVFoundation

struct DeslizeDedo: View {
    @State var audioPlayer: AVAudioPlayer!
    @State var deslize = 100
    
    @State private var shouldShow: Bool = false
    
    var body: some View {
        ZStack{
            
            NavigationLink("",destination: BolaGuiada().navigationBarBackButtonHidden(true) ,isActive: $shouldShow)
            
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(alignment: .center){
                
                Spacer()
                    .frame()
                
                Text("\(Text("Deslize").foregroundColor(.yellow)) os dedos para os lados para \(Text("mover").foregroundColor(.yellow)) a raquete e rebater a bola")
                    .font(.custom("DaysOne-Regular", size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 310, height: 270, alignment: .center)
                
                Spacer().frame()
                
                VStack{
                    
                    Image("raquete")
                        .frame(width: 145, height: 33, alignment: .center)
                        .offset(x: CGFloat(deslize))
                        .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true))
                        .padding(20)
                    Spacer().frame()
                        .onAppear{
                            deslize = -100
                        }
                }
            }
        }.onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                shouldShow.toggle()
            }
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "onboardingjogo1", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            self.audioPlayer.play()
        }
    }
}


struct DeslizeDedo_Previews: PreviewProvider {
    static var previews: some View {
        DeslizeDedo()
    }
}
