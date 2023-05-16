//
//  StartAppField.swift
//  jab
//
//  Created by João Pedro França on 10/05/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color("#F1F5F4")
                .ignoresSafeArea()
            VStack {
                //Logo Inicial do aplicativo
                Image("Logo_App")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                ProgressView()
                //Função do Loading para ir para a a tela de usuário (Estudar como fazer isso)
            }
        }
    }
}


struct StartView: View {
//    @State var navigationPath = NavigationPath()
    var body: some View {
//        NavigationStack(path: $navigationPath) {
            //            ContentView()
            LoginView()
//        }
    }
}


struct ContentView: View {
    @State var isLoading = true
    var body: some View {
        ZStack{
            if isLoading {
                LoadingView()

            } else {
                LoginView()
            }
        }.onAppear {
//             Carregando com tempo de 3 segundos
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
            }
        }
    }
}


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
