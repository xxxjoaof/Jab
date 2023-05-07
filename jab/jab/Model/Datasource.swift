//
//  Datasource.swift
//  jab
//
//  Created by Caroline Costa on 03/05/23.
//

import Foundation

struct Datasource: Identifiable{
    /// Properties
    let id =  UUID()
    let email: String
    let passwd: String
    
    /// Functions
    /*func allAnswers() -> [String]{
        var options = wrongAnswers
        options.append(answer)
        return options.shuffled()
    }*/
}


//MARK: - dados de login
let database = [
    Datasource(email: "carol@carol.com.br", passwd: "1234"),
  
]
