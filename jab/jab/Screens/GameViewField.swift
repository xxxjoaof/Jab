//
//  GameViewField.swift
//  jab
//
//  Created by João Pedro França on 08/05/23.
//

import SwiftUI

struct GameViewField: View {

    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        ZStack {
            //fundo azul
            Color("#0601FF")
                .ignoresSafeArea(.all)
            //circulo no fundo
            Capsule()
                .fill(.white)
                .frame(width: 800, height: 700)
                .offset(x:5, y: 45)

//            Button(action: {
//                print("Clicou mini tela")
//            }, label: {
//                Image(systemName: "text.justify")
//                    .frame(width: 40, height: 40, alignment: .center)
//                    .font(.system(size: 40, weight: .semibold, design: .default))
//                    .foregroundStyle(.black)
//
//            })
//            .position(x: 140, y: 70) // Define a posição do botão


            Image("Logo_App")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 100)
                .offset(x: 130, y: -320)
            
            Text("Jogos")
                .font(.system(size: 40))
                .bold()
                .foregroundColor(Color("#FFFFFF"))
                .offset(x: -0, y: -340)

            VStack{
                
                //jogo das formas geometricas
                Text("Formas Geométricas")
                    .font(.system(size: 24))
                    .bold()
                    .padding(.top, 70)
                ZStack{
                    Rectangle()
                        .fill(.yellow)
                        .frame(width: 250, height: 110)
                        .cornerRadius(20)
                    Image("shapes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 110, alignment: .center)
                }.onTapGesture {
                    navigationPath.append(RoutePath.geometricGame(question: database1.first!))
                }

                //jogo das cores
                Text("Cores")
                    .font(.system(size: 24))
                    .bold()

                ZStack{
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 250, height: 110)
                        .cornerRadius(20)
                    Image("cores")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 100, alignment: .center)
                }.onTapGesture {
                    navigationPath.append(RoutePath.colorGame(question: database2.first!))
                }

                //jogo dos animais
                Text("Animais")
                    .font(.system(size: 24))
                    .bold()

                ZStack{
                    Rectangle()
                        .fill(.red)
                        .frame(width: 250, height: 110)
                        .cornerRadius(20)
                    Image("animais")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 110, alignment: .center)
                }.onTapGesture {
                    navigationPath.append(RoutePath.animalGame(question: database3.first!))
                }

                //jogo das frutas
                Text("Frutas")
                    .font(.system(size: 24))
                    .bold()

                ZStack{
                    Rectangle()
                        .fill(.green)
                        .frame(width: 250, height: 110)
                        .cornerRadius(20)
                    Image("frutas")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 110, alignment: .center)
                }.onTapGesture {
                    navigationPath.append(RoutePath.fruitGame(question: database4.first!))
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            GameViewField(navigationPath: .constant(NavigationPath()))
        }
    }
}
