//
//  FruitView.swift
//  jab
//
//  Created by João Pedro França on 07/05/23.
//

import SwiftUI
import AVFoundation

var playerFruit: AVAudioPlayer!

struct FruitView: View {

    @State var imagensAnimais : Image? = Image("abacaxi")
    @State var contador = 0
    @State var question: Question
    @State var questionList = database4
    @State var success = false
    @State var selectedAnswer: String? = nil
    @State var numCorrectAnswer: Int = 0
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
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
                        if contador <= 9 {
                            question = questionList[contador]
                        }

                        // atualiza a imagem para a próxima pergunta
                        if contador == 0 {
                            self.imagensAnimais = Image("abacaxi")
                        } else if contador == 1 {
                            self.imagensAnimais = Image("banana")
                        } else if contador == 2 {
                            self.imagensAnimais = Image("kiwi")
                        } else if contador == 3 {
                            self.imagensAnimais = Image("laranja")
                        } else if contador == 4 {
                            self.imagensAnimais = Image("maça")
                        } else if contador == 5 {
                            self.imagensAnimais = Image("manga")
                        } else if contador == 6 {
                            self.imagensAnimais = Image("melancia")
                        } else if contador == 7 {
                            self.imagensAnimais = Image("morango")
                        } else if contador == 8 {
                            self.imagensAnimais = Image("pera")
                        } else if contador == 9 {
                            self.imagensAnimais = Image("uva")
                        } else if contador == 10 {
                            navigationPath.append(RoutePath.congratulation(score: numCorrectAnswer))
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
            url = Bundle.main.url(forResource: "abacaxi", withExtension: "mp3")
        case 1:
            url = Bundle.main.url(forResource: "banana", withExtension: "mp3")
        case 2:
            url = Bundle.main.url(forResource: "kiwi", withExtension: "mp3")
        case 3:
            url = Bundle.main.url(forResource: "laranja", withExtension: "mp3")
        case 4:
            url = Bundle.main.url(forResource: "maça", withExtension: "mp3")
        case 5:
            url = Bundle.main.url(forResource: "manga", withExtension: "mp3")
        case 6:
            url = Bundle.main.url(forResource: "melancia", withExtension: "mp3")
        case 7:
            url = Bundle.main.url(forResource: "morango", withExtension: "mp3")
        case 8:
            url = Bundle.main.url(forResource: "pera", withExtension: "mp3")
        case 9:
            url = Bundle.main.url(forResource: "uva", withExtension: "mp3")
            // adicione os outros casos para as outras imagens
        default:
            url = nil
        }
        
        guard url != nil else {
            return
        }
        
        do {
            playerFruit = try AVAudioPlayer(contentsOf: url!)
            playerFruit?.play()
        } catch {
            print("error")
        }
    }
    
}


struct FruitView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            FruitView(question:database4.first!, navigationPath: .constant(NavigationPath()))
        }
    }
}
