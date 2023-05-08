//
//  ContentView.swift
//  jab
//
//  Created by João Pedro França on 27/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            //fundo azul
            Rectangle()
                .fill(.blue)
                .ignoresSafeArea()
            //circulo no fundo
            Circle()
                .fill(.white)
                .frame(width: 600, height: 900)
            
            Button(action: {
                print("Clicou mini tela")
            }, label: {
                Image(systemName: "text.justify")
                    .frame(width: 40, height: 40, alignment: .center)
                    .font(.system(size: 40, weight: .semibold, design: .default))
                    .foregroundStyle(.black)

            })
            .position(x: 140, y: 70) // Define a posição do botão
            
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 100)
                .offset(x: 140, y: -360)
            
            Text("Jogos")
                .font(.system(size: 30))
                .bold()
                .offset(x: 0, y: -370)
            
            VStack{
                
                //jogo das formas geograficas
                Text("Formas Geográficas")
                    .font(.system(size: 20))
                    .bold()
                    .padding(.top, 40.0)
                
                Button(action: {
                    print("Jogo das formas geométricas")
                },label: {
                    ZStack{
                        Rectangle()
                            .fill(.yellow)
                            .frame(width: 250, height: 110)
                            .cornerRadius(20)
                        Image("geo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110, height: 110, alignment: .center)
                    }
                })
                
                //jogo das cores
                Text("Cores")
                    .font(.system(size: 20))
                    .bold()
                
                Button(action: {
                    print("Jogo das cores")
                }, label: {
                    ZStack{
                        Rectangle()
                            .fill(.blue)
                            .frame(width: 250, height: 110)
                            .cornerRadius(20)
                        Image("cores")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100, alignment: .center)
                    }
                })
                
                //jogo dos animais
                Text("Animais")
                    .font(.system(size: 20))
                    .bold()
                
                Button(action: {
                    print("Jogo dos animais")
                }, label: {
                    ZStack{
                        Rectangle()
                            .fill(.red)
                            .frame(width: 250, height: 110)
                            .cornerRadius(20)
                        Image("animais")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110, height: 110, alignment: .center)
                    }
                })
                //jogo das frutas
                Text("Frutas")
                    .font(.system(size: 20))
                    .bold()
                
                Button(action: {
                    print("Jogo dos animais")
                }, label: {
                    ZStack{
                        Rectangle()
                            .fill(.green)
                            .frame(width: 250, height: 110)
                            .cornerRadius(20)
                        Image("frutas")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110, height: 110, alignment: .center)
                    }
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
