//
//  ArrasteDireita.swift
//  DvdScreensaver
//
//  Created by Mariane Vilarim on 27/10/22.
//

import SwiftUI
import AVKit

struct ArrasteDireita: View {
    @State var audioPlayer: AVAudioPlayer!
    @State private var shouldShow: Bool = false
  
    var body: some View {
        ZStack{
            NavigationLink("",destination: ArrasteEsquerda().navigationBarBackButtonHidden(true) ,isActive: $shouldShow)
            
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                Text("\(Text("Arraste").foregroundColor(.yellow)) para os lados para \(Text("navegar").foregroundColor(.yellow)) pelo menu")
                    .font(.custom("DaysOne-Regular", size: 35))
                    .foregroundColor(.white)
                    .bold()
                    .minimumScaleFactor(15)
                    .multilineTextAlignment(.center)
                    .padding(40)
                
                Image("arraste direita")
            }
        }.highPriorityGesture(DragGesture(minimumDistance: 25, coordinateSpace: .local)
            .onEnded { value in
                if abs(value.translation.height) < abs(value.translation.width) {
                    if abs(value.translation.width) > 50.0 {
                        if value.translation.width < 0 {
                            self.swipeRightToLeft()
                        } else if value.translation.width > 0 {
                            self.swipeLeftToRight()
                        }
                    }
                }
            }
        )
        .onAppear {
            let sound = Bundle.main.path(forResource: "onboarding3", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            self.audioPlayer.play()
        }
    }
    func  swipeRightToLeft(){
        self.audioPlayer.pause()
        shouldShow.toggle()
    }
    func swipeLeftToRight(){
        self.audioPlayer.pause()
        shouldShow.toggle()
    }
}

struct ArrasteDireita_Previews: PreviewProvider {
    static var previews: some View {
        ArrasteDireita()
    }
}
