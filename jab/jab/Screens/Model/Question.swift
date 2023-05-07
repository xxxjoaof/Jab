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

//MARK: - Banco de dados do jogo de Animais

let database3 = [
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

//MARK: - Banco de dados do jogo de Fruta

let database4 = [
    Question(imageName: "abacaxi", prompt: "Que fruta é esse?", answer: "Abacaxi", wrongAnswers: ["Elefante","Zebra","Macaco"]),
    
    Question(imageName: "banana", prompt: "Que fruta é esse?", answer: "Banana", wrongAnswers: ["Leão","Jacaré","Tucano"]),
    
    Question(imageName: "kiwi", prompt: "Que fruta é esse?", answer: "Kiwi", wrongAnswers: ["Jacaré","Elefante","Leão"]),
    
    Question(imageName: "laranja", prompt: "Que fruta é esse?", answer: "Laranja", wrongAnswers: ["Vaca","Zebra","Gato"]),
    
    Question(imageName: "maça", prompt: "Que fruta é esse?", answer: "Maça", wrongAnswers: ["Elefante","Zebra","Macaco"]),
    
    Question(imageName: "manga", prompt: "Que fruta é esse?", answer: "Manga", wrongAnswers: ["Elefante","Zebra","Vaca"]),
    
    Question(imageName: "melancia", prompt: "Que fruta é esse?", answer: "Melancia", wrongAnswers: ["Macaco","Zebra","Leão"]),
    
    Question(imageName: "morango", prompt: "Que fruta é esse?", answer: "Morango", wrongAnswers: ["Gato","Zebra","Macaco"]),
    
    Question(imageName: "pera", prompt: "Que fruta é esse?", answer: "Pera", wrongAnswers: ["Elefante","Zebra","Macaco"]),
    
    Question(imageName: "uva", prompt: "Que fruta é esse?", answer: "Uva", wrongAnswers: ["Gato","Tucano","Jacaré"]),
]

