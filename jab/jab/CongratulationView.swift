//
//  ContentView.swift
//  jab
//
//  Created by João Pedro França on 27/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        ZStack{
            //Cor de fundo geral
            Color("#0601FF")
                .ignoresSafeArea(.all)
            
            //Background confetti de fundo geral
            Image("Confetti")
                .resizable()
                .scaledToFit()
                .frame(width: 1400, height: 1400, alignment: .center)
                .position(x: 0, y: 600)
            
            Image("Logo_App")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .position(x: 350, y: 25)
            
            VStack{
                //Título da tela
                Text("Parabéns!!!")
                    .font(.system(size: 50, weight: .semibold, design: .default))
                    .foregroundColor(Color("#E6BD0A"))
                
                //Circulos com Imagem de Parabéns no centro
                ZStack{
                    Circle()
                        .frame(width: 300, height: 300, alignment: .top)
                        .foregroundColor(Color("#09E805"))
                    
                    Circle()
                        .frame(width: 270, height: 270, alignment: .top)
                        .foregroundColor(Color("#FFFFFF"))
                    
                    //Imagem batendo palmas
                    Image("Batendo_Palmas")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                }
                
                HStack{
                    ZStack{
                        Capsule()
                            .frame(width: 150, height: 50)
                            .foregroundColor(Color("#09E805"))
                        
                        Text("Acertos:")
                            .font(.system(size: 25, weight: .semibold, design: .default))
                            .foregroundColor(Color.black)
                    }
                    
                    ZStack{
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color("#09E805"))
                    }
                }
                .padding()
                
                VStack{
                    ZStack{
                        Capsule()
                            .frame(width: 230, height: 50)
                            .foregroundColor(Color("#09E805"))
                        
                        Text("Reiniciar")
                            .font(.system(size: 25, weight: .semibold, design: .default))
                            .foregroundColor(Color.black)
                    }
                    
                    ZStack{
                        Capsule()
                            .frame(width: 230, height: 50)
                            .foregroundColor(Color("#FF0000"))
                        
                        Text("Menu Inicial")
                            .font(.system(size: 25, weight: .semibold, design: .default))
                            .foregroundColor(Color("#FFFFFF"))
                    }
                }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            }.padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
