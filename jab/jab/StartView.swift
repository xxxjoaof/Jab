//
//  ContentView.swift
//  jab
//
//  Created by João Pedro França on 27/04/23.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color("#F1F5F4")
                    .ignoresSafeArea()
                
                
                VStack{
                    //Logo Inicial do aplicativo
                    Image("LogoStart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    
                    //Função do Loading para ir para a a tela de usuário (Estudar como fazer isso)
                    
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
