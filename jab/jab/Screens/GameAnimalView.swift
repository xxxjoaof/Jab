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
    @State var question: Question
    @State var questionList = database
    @State var success = false
    @State var selectedAnswer: String? = nil // added
    @State var numCorrectAnswer: Int = 0
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("#0601FF")
                    .ignoresSafeArea(.all)
                
                Button {
                    print("Clicou em voltar para Menu")
                } label: {
                    Image(systemName: "arrow.uturn.backward")
                        .position(x:25, y:-250)
                        .frame(width: 330, height: 300, alignment: .center)
                        .font(.system(size: 40, weight: .semibold, design: .default))
                        .foregroundStyle(.white)
                }
                
                Capsule()
                    .frame(width: 700, height: 700)
                    .foregroundColor(Color("#FFFFFF"))
                    .offset(x: 0, y: 400)
                
               
                
                VStack{
                    Text("\(contador + 1)/10")
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
                            Image(systemName:"speaker.wave.2.circle.fill")
                                .frame(width: 330, height: 300, alignment: .center)
                                .font(.system(size: 25, weight: .black, design: .default))
                                .foregroundStyle(.black, .green)
                                .offset(x: 130, y: 125)
                        }
                        
                    }
                    
                    
                    VStack{
                        let question = database[contador]
                        Text(question.prompt)
                            .font(.system(size: 30, weight: .semibold, design: .default))
                            .foregroundColor(Color("#FFFFFF"))
                                                
                        ForEach(question.allAnswers(), id: \.self) { answer in
                            Button {
                                selectedAnswer = answer
                                validate(selected: answer)
                            } label: {
                                ZStack{
                                    Capsule()
                                        .frame(width: 250, height: 50)
                                        .foregroundColor(selectedAnswer == answer ? (success ? .green : .red) : Color("#D9D9D9"))
                                    
                                    Text(answer)
                                        .font(.system(size: 25, weight: .semibold, design: .default))
                                        .foregroundColor(Color.black)
                                }
                            }
                            .disabled(selectedAnswer != nil) // disable buttons after an answer has been selected
                        }

                    }

                    
                    NavigationLink(destination: CongratulationView()){
                        Button {
                            if selectedAnswer != nil {
                                selectedAnswer = nil
                                success = false
                                if contador < 9 {
                                    contador += 1
                                } else {
                                    contador = 9
                                }

                                question = questionList[contador]
                                
                                // atualiza a imagem para a próxima pergunta
                                if contador == 0 {
                                    self.imagensAnimais = Image("cachorro")
                                } else if contador == 1 {
                                    self.imagensAnimais = Image("elefante")
                                } else if contador == 2 {
                                    self.imagensAnimais = Image("gato")
                                } else if contador == 3 {
                                    self.imagensAnimais = Image("jacaré")
                                } else if contador == 4 {
                                    self.imagensAnimais = Image("leao")
                                } else if contador == 5 {
                                    self.imagensAnimais = Image("macaco")
                                } else if contador == 6 {
                                    self.imagensAnimais = Image("onça")
                                } else if contador == 7 {
                                    self.imagensAnimais = Image("tucano")
                                } else if contador == 8 {
                                    self.imagensAnimais = Image("vaca")
                                } else if contador == 9 {
                                    self.imagensAnimais = Image("zebra")
                                }
                            }
                        } label: {
                            Text("Next")
                                .font(.system(size: 35, weight: .semibold, design: .default))
                        }
                        .foregroundColor(Color.black)
                        .frame(width: 150, height: 50)
                        .background(Color("#E6BD0A"))
                        .cornerRadius(30)
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 60, trailing: 0))
                    }
                }
            }
        }
        }
        
    func validate(selected: String) {
        success = (question.answer == selected)
        if success {
            numCorrectAnswer += 1
        }
        print("\(numCorrectAnswer)")
        print(selected)
    }
        
        
    func playSound() {
        var url: URL?
        switch contador {
        case 0:
            url = Bundle.main.url(forResource: "dog", withExtension: "mp3")
        case 1:
            url = Bundle.main.url(forResource: "elephant", withExtension: "mp3")
        case 2:
            url = Bundle.main.url(forResource: "cat", withExtension: "mp3")
        case 3:
            url = Bundle.main.url(forResource: "jacaré", withExtension: "mp3")
        case 4:
            url = Bundle.main.url(forResource: "lion", withExtension: "mp3")
        case 5:
            url = Bundle.main.url(forResource: "monkey", withExtension: "mp3")
        case 6:
            url = Bundle.main.url(forResource: "onça", withExtension: "mp3")
        case 7:
            url = Bundle.main.url(forResource: "tucano", withExtension: "mp3")
        case 8:
            url = Bundle.main.url(forResource: "vaca", withExtension: "mp3")
        case 9:
            url = Bundle.main.url(forResource: "zebra", withExtension: "mp3")
        // adicione os outros casos para as outras imagens
        default:
            url = nil
        }
        
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
        NavigationStack{
            GameAnimalView(question:database.first!)
        }
    }
}
