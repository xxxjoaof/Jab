//
//  LoginView.swift
//  jab
//
//  Created by Caroline Costa on 03/05/23.
//

import SwiftUI




struct LoginView: View {
    
    @State var questionList = database
    
    var body: some View {
        
        
        ZStack{
            Color(red: 0.946, green: 0.963, blue: 0.955, opacity: 0.865)
                .ignoresSafeArea()
                            
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150.0, height: 150.0, alignment: .center)
                    .foregroundColor(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .shadow(radius: 10, x: 5.0, y: 10.0)
                    .padding(10)
                    
                
                //.resizable()
                //.aspectRatio(contentMode: .fit)
                //.frame(height: 100)
                //.shadow(color: .red, radius: 10, x: 5.0, y: 10.0)
                
                Spacer() // this use all space available above the TextField
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 2)
                    }
                    .padding(.horizontal)
                Spacer() // this use all space available below the TextField
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
