//
//  ColorGameViewField.swift
//  jab
//
//  Created by João Pedro França on 09/05/23.
//

import SwiftUI
import AVFoundation

var playerColor: AVAudioPlayer!

struct ColorGameViewField: View {

    @State var imagensCores : Image? = Image("black")
    @State var contador = 0
    @State var question: Question
    @State var questionList = database2
    @State var success = false
    @State var selectedAnswer: String? = nil
    @State var numCorrectAnswer: Int = 0
    @State var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack{
                Color("#0601FF")
                    .ignoresSafeArea(.all)
                
                Button {
                       print("Clicou em voltar para Menu")
                   } label: {
                       Image(systemName: "arrow.uturn.backward")
                       .position(x: 25, y: -250)
                       .frame(width: 330, height: 300, alignment: .center)
                       .font(.system(size: 40, weight: .semibold, design: .default))
                       .foregroundStyle(.white)
                   }
                   .position(x: 25, y: -250) // Define a posição do botão
                
                Capsule()
                    .frame(width: 700, height: 700)
                    .foregroundColor(Color("#FFFFFF"))
                    .offset(x: 0, y: 400)
                
                Capsule()
                    .frame(width: 700, height: 700)
                    .foregroundColor(Color("#37B5FE"))
                    .offset(x: 0, y: 450)
                
                Spacer()
                
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
                        
                        imagensCores!
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
                            .disabled(selectedAnswer != nil)
                        }
                        
                    }
                    
                    Button {
                        if selectedAnswer != nil {
                            selectedAnswer = nil
                            success = false
                            contador += 1
                            if contador <= 9 {
                                question = questionList[contador]
                            }
                            
                            // atualiza a imagem para a próxima pergunta
                            if contador == 0 {
                                self.imagensCores = Image("black")
                            } else if contador == 1 {
                                self.imagensCores = Image("blue")
                            } else if contador == 2 {
                                self.imagensCores = Image("brown")
                            } else if contador == 3 {
                                self.imagensCores = Image("gray")
                            } else if contador == 4 {
                                self.imagensCores = Image("green")
                            } else if contador == 5 {
                                self.imagensCores = Image("laranjacolor")
                            } else if contador == 6 {
                                self.imagensCores = Image("pink")
                            } else if contador == 7 {
                                self.imagensCores = Image("purple")
                            } else if contador == 8 {
                                self.imagensCores = Image("red")
                            } else if contador == 9 {
                                self.imagensCores = Image("yellow")
                            } else if contador == 10 {
                                navigationPath.append("congratulation_view")
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
                    .padding(EdgeInsets(top: 30, leading: 0, bottom: 1, trailing: 0))
                }
            }
            .navigationDestination(for: String.self) { score in
                CongratulationView(score: $numCorrectAnswer)
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
            url = Bundle.main.url(forResource: "preto", withExtension: "mp3")
        case 1:
            url = Bundle.main.url(forResource: "azul", withExtension: "mp3")
        case 2:
            url = Bundle.main.url(forResource: "marrom", withExtension: "mp3")
        case 3:
            url = Bundle.main.url(forResource: "cinza", withExtension: "mp3")
        case 4:
            url = Bundle.main.url(forResource: "verde", withExtension: "mp3")
        case 5:
            url = Bundle.main.url(forResource: "laranjacolor", withExtension: "mp3")
        case 6:
            url = Bundle.main.url(forResource: "rosa", withExtension: "mp3")
        case 7:
            url = Bundle.main.url(forResource: "roxo", withExtension: "mp3")
        case 8:
            url = Bundle.main.url(forResource: "vermelho", withExtension: "mp3")
        case 9:
            url = Bundle.main.url(forResource: "amarelo", withExtension: "mp3")
            // adicione os outros casos para as outras imagens
        default:
            url = nil
        }
        
        guard url != nil else {
            return
        }
        
        do {
            playerColor = try AVAudioPlayer(contentsOf: url!)
            playerColor?.play()
        } catch {
            print("error")
        }
    }
    
}


struct ColorGameViewField_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ColorGameViewField(question:database2.first!)
        }
    }
}
