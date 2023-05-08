//
//  GeometricView.swift
//  jab
//
//  Created by João Pedro França on 08/05/23.
//

import SwiftUI
import AVFoundation

var playerGeometric: AVAudioPlayer!

struct GeometricView: View {

    @State var imagensAnimais : Image? = Image("esfera")
    @State var contador = 0
    @State var question: Question
    @State var questionList = database1
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
                    .foregroundColor(Color("#FF0000"))
                    .offset(x: 0, y: 450)
                
                Spacer()
                
                VStack{
                    Text("\(contador + 1)/9")
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
                            if contador <= 8 {
                                question = questionList[contador]
                            }
                            
                            // atualiza a imagem para a próxima pergunta
                            if contador == 0 {
                                self.imagensAnimais = Image("circulo")
                            } else if contador == 1 {
                                self.imagensAnimais = Image("hexagono")
                            } else if contador == 2 {
                                self.imagensAnimais = Image("losango")
                            } else if contador == 3 {
                                self.imagensAnimais = Image("oval")
                            } else if contador == 4 {
                                self.imagensAnimais = Image("pentagono")
                            } else if contador == 5 {
                                self.imagensAnimais = Image("quadrado")
                            } else if contador == 6 {
                                self.imagensAnimais = Image("retangulo")
                            } else if contador == 7 {
                                self.imagensAnimais = Image("trapezio")
                            } else if contador == 8 {
                                self.imagensAnimais = Image("triangulo")
                            } else if contador == 9 {
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
                CongratulationView(score: numCorrectAnswer)
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
            url = Bundle.main.url(forResource: "esfera", withExtension: "mp3")
        case 1:
            url = Bundle.main.url(forResource: "hexagono", withExtension: "mp3")
        case 2:
            url = Bundle.main.url(forResource: "losango", withExtension: "mp3")
        case 3:
            url = Bundle.main.url(forResource: "oval", withExtension: "mp3")
        case 4:
            url = Bundle.main.url(forResource: "pentagono", withExtension: "mp3")
        case 5:
            url = Bundle.main.url(forResource: "quadrado", withExtension: "mp3")
        case 6:
            url = Bundle.main.url(forResource: "retangulo", withExtension: "mp3")
        case 7:
            url = Bundle.main.url(forResource: "trapezio", withExtension: "mp3")
        case 8:
            url = Bundle.main.url(forResource: "triangulo", withExtension: "mp3")
            // adicione os outros casos para as outras imagens
        default:
            url = nil
        }
        
        guard url != nil else {
            return
        }
        
        do {
            playerGeometric = try AVAudioPlayer(contentsOf: url!)
            playerGeometric?.play()
        } catch {
            print("error")
        }
    }
    
}


struct GeometricView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            GeometricView(question:database1.first!)
        }
    }
}
