//
//  ContentView.swift
//  jab
//
//  Created by João Pedro França on 27/04/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color("#F1F5F4")
                .ignoresSafeArea()
            
            VStack{
                //Logo Inicial do aplicativo
                Image("LogoStart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                ProgressView()
                //Função do Loading para ir para a a tela de usuário (Estudar como fazer isso)
                
            }
        }
    }
}

struct ContentView: View {
    @State var isLoading = true
    
    var body: some View {
        if isLoading {
            LoadingView()
                .onAppear {
                    
                    // Carregando com tempo de 3 segundos
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        isLoading = false
                    }
                }
        } else {
            // Código do login
            ZStack{
                Color("#F1F5F4")
                    .ignoresSafeArea()
                
                VStack{
                    //Logo Inicial do aplicativo
                    Image("LogoStart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    
                }
            }
        }
    }
}
struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
