//
//  AccountRegisterField.swift
//  jab
//
//  Created by João Pedro França on 08/05/23.
//

import SwiftUI

struct AccountRegisterField: View {
    
    @State var giveName = ""
    @State var giveSobrenome = ""
    @State var giveEmail = ""
    @State var giveSenha = ""
    
    var body: some View {
        ZStack{
            Rectangle()
            Color("#F1F5F4")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("Logo_App")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200, alignment: .leading)
                
                ZStack{
                    
                    
                    Capsule()
                        .fill(.white)
                        .frame(width: 280, height: 40, alignment: .center)
                        .cornerRadius(20)
                        .overlay(
                            Capsule()
                                .stroke(Color("#D9D9D9"), lineWidth: 3)
                                
                        )
                        .clipShape(
                           RoundedRectangle(cornerRadius: 20)
                        )
                    
                    TextField("Nome:", text: $giveName, prompt: Text("Nome"))
                        .frame(width: 250, height: 40, alignment: .center)
                        .foregroundColor(.black)
                    
                }.padding(5)
                
                ZStack{
                    Capsule()
                        .fill(.white)
                        .frame(width: 280, height: 40, alignment: .center)
                        .cornerRadius(20)
                        .overlay(
                            Capsule()
                                .stroke(Color("#D9D9D9"), lineWidth: 3)
                                
                        )
                        .clipShape(
                           RoundedRectangle(cornerRadius: 20)
                        )
                    
                    TextField("Sobrenome:", text: $giveSobrenome, prompt: Text("Sobrenome"))
                        .frame(width: 250, height: 40, alignment: .center)
                        .foregroundColor(.black)
                    
                }.padding(5)
                
                ZStack{
                    
                    Capsule()
                        .fill(.white)
                        .frame(width: 280, height: 40, alignment: .center)
                        .cornerRadius(20)
                        .overlay(
                            Capsule()
                                .stroke(Color("#D9D9D9"), lineWidth: 3)
                                
                        )
                        .clipShape(
                           RoundedRectangle(cornerRadius: 20)
                        )
                    
                    TextField("E-mail:", text: $giveEmail, prompt: Text("E-mail"))
                        .frame(width: 250, height: 40, alignment: .center)
                        .foregroundColor(.black)
                }.padding(5)
                
                ZStack{
                    
                    Capsule()
                        .fill(.white)
                        .frame(width: 280, height: 40, alignment: .center)
                        .cornerRadius(20)
                        .overlay(
                            Capsule()
                                .stroke(Color("#D9D9D9"), lineWidth: 3)
                                
                        )
                        .clipShape(
                           RoundedRectangle(cornerRadius: 20)
                        )
                    
                    SecureField("Senha:", text: $giveSenha, prompt: Text("Senha"))
                        .frame(width: 250, height: 40, alignment: .center)
                        .foregroundColor(.black)
                }.padding(5)
                
                Button(action: {
                    print("Cadastro com sucesso!!")
                }, label: {
                    Text("Cadastrar")
                        .font(.system(size: 23, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                        .frame(height: 40)
                        .frame(width: 280)
                        .background(.blue)
                        .cornerRadius(20)
                        .padding()
                    
                })
            }
        }
    }

    
}

struct AccountRegisterField_Previews: PreviewProvider {
    static var previews: some View {
        AccountRegisterField()
    }
}
