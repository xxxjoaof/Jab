//
//  GameAnimalView.swift
//  jab
//
//  Created by João Pedro França on 30/04/23.
//

import SwiftUI
import AVFoundation

var player: AVAudioPlayer!

struct GameAnimalView: View {
    
    @State var imagensAnimais : Image? = Image("cachorro")
    @State var contador = 0

    
    var body: some View {
        
        ZStack{
            Color("#0601FF")
                .ignoresSafeArea(.all)
            
            Capsule()
                .frame(width: 700, height: 700)
                .foregroundColor(Color("#FFFFFF"))
                .offset(x: 0, y: 350)
                        
            VStack{
                Text("\(contador+1)/10")
                    .font(.system(size: 30, weight: .semibold, design: .default))
                    .foregroundColor(Color("#FFFFFF"))
                
                ZStack{
                    
                    Rectangle()
                        .frame(width: 330, height: 300, alignment: .top)
                        .cornerRadius(20)
                        .foregroundColor(Color("#FFFFFF"))
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 3))
                     
                    imagensAnimais!
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    
                    Button(action: {
                        self.playSound()
                    }) {
                        Image(systemName:"speaker.wave.3")
                            .frame(width: 330, height: 300, alignment: .center)
                            .font(.system(size: 25, weight: .black, design: .default))
                            .foregroundStyle(.black, .red)
                            .offset(x: 130, y: 125)
                    }
                    
                }
                
                Text("Que animal é esse?")
                    .font(.system(size: 30, weight: .semibold, design: .default))
                
                
                
                Button{
                    if contador == 0 {
                        self.imagensAnimais = Image("cachorro")
                    }else if contador == 1 {
                        self.imagensAnimais = Image("elefante")
                    }else if contador == 2 {
                        self.imagensAnimais = Image("gato")
                    }else if contador == 3 {
                        self.imagensAnimais = Image("jacaré")
                    }else if contador == 4 {
                        self.imagensAnimais = Image("leao")
                    }else if contador == 5 {
                        self.imagensAnimais = Image("macaco")
                    }else if contador == 6 {
                        self.imagensAnimais = Image("onça")
                    }else if contador == 7 {
                        self.imagensAnimais = Image("tucano")
                    }else if contador == 8 {
                        self.imagensAnimais = Image("vaca")
                    }else if contador == 9 {
                        self.imagensAnimais = Image("zebra")
                        
                        contador = 0
                        return
                    }
                    
                    if contador < 10 {
                        contador += 1
                    }else {
                        contador = 0
                    }
                    
                    
                } label: {
                    Text("Next")
                        .font(.system(size: 35, weight: .semibold, design: .default))
                }
                .foregroundColor(Color.black)
                .frame(width: 150, height: 65)
                .background(Color("#E6BD0A"))
                .cornerRadius(30)
                
            }
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "dog", withExtension: "mp3")
        
        guard url != nil else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
        } catch {
            print("error")
        }
    }
}

struct GameAnimalView_Previews: PreviewProvider {
    static var previews: some View {
        GameAnimalView()
    }
}
