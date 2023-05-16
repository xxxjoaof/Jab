//
//  LoginView.swift
//  jab
//
//  Created by Caroline Costa on 03/05/23.
//

import SwiftUI


let userEmail = ""
let userPassword = ""

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var authFail: Bool = false
    @State var authSuces: Bool = false
    
    //    @State var loginSuccess: Bool = false
    @State var navigationPath: NavigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
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
                            //                            self.loginSuccess = true
                            navigationPath.append(RoutePath.gameList)
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
                    .padding()

                }
            }

            .navigationDestination(for: RoutePath.self) { path in
                path.view($navigationPath)
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

enum RoutePath: Hashable {

    case gameList
    case geometricGame(question: Question)
    case fruitGame(question: Question)
    case colorGame(question: Question)
    case animalGame(question: Question)
    case congratulation(score: Int)

    @ViewBuilder func view(_ path: Binding<NavigationPath>) -> some View{
        switch self {
        case .gameList:
            GameViewField(navigationPath: path)
        case let .geometricGame(question):
            GeometricView(question: question, navigationPath: path)
        case let .fruitGame(question):
            FruitView(question: question, navigationPath: path)
        case let .colorGame(question):
            ColorGameViewField(question: question, navigationPath: path)
        case let .animalGame(question):
            GameAnimalView(question: question, navigationPath: path)
        case let .congratulation(score):
            CongratulationView(navigationPath: path, score: .constant(score))
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case .gameList:
            break
        case let .geometricGame(question):
            hasher.combine(question)
        case let .fruitGame(question):
            hasher.combine(question)
        case let .colorGame(question):
            hasher.combine(question)
        case let .animalGame(question):
            hasher.combine(question)
        case let .congratulation(score):
            hasher.combine(score)
        }
    }

    static func == (lhs: RoutePath, rhs: RoutePath) -> Bool {
        switch (lhs, rhs) {
        case (.gameList, .gameList),
            (.geometricGame, .geometricGame),
            (.fruitGame, .fruitGame),
            (.colorGame, .colorGame),
            (.animalGame, .animalGame),
            (.congratulation, .congratulation):
            return true
        default:
            return false
        }
    }
}
