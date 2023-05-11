//
//  LoginView.swift
//  jab
//
//  Created by Caroline Costa on 03/05/23.
//

import SwiftUI


let userEmail = "aluno"
let userPassword = "12345"

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var authFail: Bool = false
    @State var authSuces: Bool = false
    
    @State var loginSuccess: Bool = false
    
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color(red: 0.946, green: 0.963, blue: 0.955, opacity: 0.865)
                    .ignoresSafeArea()
                
                VStack {
                    LogoImage()
                    EmailTextField(email: $email)
                    PasswordSecureField(password: $password)
                    
                    //Button for forgot the password
                    Button {
                        print("Clicou no esqueceu a senha.")
                    } label: {
                        ForgotPasswordField()
                    }
                    
                    
                    if authFail {
                        Text("E-mail/Senha incorreto!")
                            .font(.headline)
                            .offset(y:-10)
                            .foregroundColor(.red)
                            .padding(5)
                    }
                    
                    
                    Button(action: {
                        if self.email == userEmail && self.password == userPassword {
                            self.authSuces = true
                            self.authFail = false
                            self.loginSuccess = true
                        } else {
                            self.authFail = true
                            self.authSuces = false
                        }
                    }) {
                        LoginButton()
                    }
                    
                    
                    Spacer()
                    
                    NavigationLink(destination: AccountRegisterField()) {
                        RegisterAccountField()
                    }
                }.navigationDestination(isPresented: $loginSuccess, destination: {
                    GameViewField(question: database1.first!)
                })
                .padding()
            }
        }
    }
}

//MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//MARK: - Logo
struct LogoImage: View {
    var body: some View {
        Image("Logo_App")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200, alignment: .center)
            .clipped()
            .cornerRadius(150)
            .padding(.top, 150)
    }
}

//MARK: - BotaoLogin
struct LoginButton: View {
    var body: some View {
        NavigationStack{
            Text("Acessar")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 220, height:40)
                .background(Color.blue)
                .cornerRadius(35)
                .padding()
                .padding(.top, -5)
        }
    }
}

//MARK: - EmailTextField
struct EmailTextField: View {
    @Binding var email: String
    
    var body: some View {
        TextField("E-mail", text: $email)
            .padding()
            .background(Color.white)
            .foregroundColor(.gray)
            .frame(width: 300, height: 40)
            .cornerRadius(35)
            .autocapitalization(.none)
    }
}

//MARK: - PasswordSecureField
struct PasswordSecureField: View {
    @Binding var password: String
    
    var body: some View {
        SecureField("Senha", text: $password)
            .padding()
            .background(Color.white)
            .foregroundColor(.gray)
            .frame(width: 300, height: 40)
            .cornerRadius(35)
    }
}

//MARK: - ForgotPasswordField
struct ForgotPasswordField: View {
    
    var body: some View {
        Text("Esqueceu a senha?")
            .foregroundColor(Color.gray)
            .font(.system(size: 15, weight: .semibold, design: .default))
            .padding(EdgeInsets(top: 0, leading: 180, bottom: 0, trailing: 40))
    }
}

//MARK: - RegisterAccountField
struct RegisterAccountField: View {
    
    var body: some View {
        
        VStack{
            Divider()
                .frame(width: 500, height: 20)
            Text("Não tenho uma conta. Toque aqui para criar uma agora.")
                .foregroundColor(Color.gray)
                .font(.system(size: 13, weight:.medium, design: .default))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}
