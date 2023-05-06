//
//  Question.swift
//  jab
//
//  Created by João Pedro França on 06/05/23.
//

import Foundation

struct Question: Identifiable{
    let id = UUID()
    let imageName: String
    let prompt: String
    let answer: String
    let wrongAnswers: [String]
    
    func allAnswers () -> [String] {
        var options = wrongAnswers
        options.append(answer)
        return options
    }
}

//MARK: - Criando dados pré-carregados
let database = [
    Question(imageName: "cachorro", prompt: "Que animal é esse?", answer: "Cachorro", wrongAnswers: ["Elefante","Zebra","Macaco"]),
    
    Question(imageName: "elefante", prompt: "Que animal é esse?", answer: "Elefante", wrongAnswers: ["Leão","Jacaré","Tucano"]),
    
    Question(imageName: "gato", prompt: "Que animal é esse?", answer: "Gato", wrongAnswers: ["Jacaré","Elefante","Leão"]),
    
    Question(imageName: "jacaré", prompt: "Que animal é esse?", answer: "Jacaré", wrongAnswers: ["Vaca","Zebra","Gato"]),
    
    Question(imageName: "leao", prompt: "Que animal é esse?", answer: "Leão", wrongAnswers: ["Elefante","Zebra","Macaco"]),
    
    Question(imageName: "macaco", prompt: "Que animal é esse?", answer: "Macaco", wrongAnswers: ["Elefante","Zebra","Vaca"]),
    
    Question(imageName: "onça", prompt: "Que animal é esse?", answer: "Onça", wrongAnswers: ["Macaco","Zebra","Leão"]),
    
    Question(imageName: "tucano", prompt: "Que animal é esse?", answer: "Tucano", wrongAnswers: ["Gato","Zebra","Macaco"]),
    
    Question(imageName: "vaca", prompt: "Que animal é esse?", answer: "Vaca", wrongAnswers: ["Elefante","Zebra","Macaco"]),
    
    Question(imageName: "zebra", prompt: "Que animal é esse?", answer: "Zebra", wrongAnswers: ["Gato","Tucano","Jacaré"]),
]
