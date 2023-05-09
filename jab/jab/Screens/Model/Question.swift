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
        return options.shuffled()
    }
}



//MARK: - Banco de dados do jogo de Animais

let database1 = [
    Question(imageName: "esfera", prompt: "Que geometria é essa?", answer: "Esfera", wrongAnswers: ["Pentágono","Quadrado","Triângulo"]),
    
    Question(imageName: "hexagono", prompt: "Que geometria é essa?", answer: "Hexágono", wrongAnswers: ["Losango","Retângulo","Quadrado"]),
    
    Question(imageName: "losango", prompt: "Que geometria é essa?", answer: "Losango", wrongAnswers: ["Pentágono","Oval","Retângulo"]),
    
    Question(imageName: "oval", prompt: "Que geometria é essa?", answer: "Oval", wrongAnswers: ["Retângulo","Trapézio","Hexágono"]),
    
    Question(imageName: "pentagono", prompt: "Que geometria é essa?", answer: "Pentágono", wrongAnswers: ["Quadrado","Retângulo","Trapézio"]),
    
    Question(imageName: "quadrado", prompt: "Que geometria é essa?", answer: "Quadrado", wrongAnswers: ["Esfera","Hexágono","Losango"]),
    
    Question(imageName: "retangulo", prompt: "Que geometria é essa?", answer: "Retângulo", wrongAnswers: ["Trapézio","Quadrado","Oval"]),
    
    Question(imageName: "trapezio", prompt: "Que geometria é essa?", answer: "Trapézio", wrongAnswers: ["Retângulo","Zebra","Quadrado"]),
    
    Question(imageName: "triangulo", prompt: "Que geometria é essa?", answer: "Triângulo", wrongAnswers: ["Retângulo","Pentágono","Oval"]),
]

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
    Question(imageName: "abacaxi", prompt: "Que fruta é esse?", answer: "Abacaxi", wrongAnswers: ["Banana","Maça","Manga"]),
    
    Question(imageName: "banana", prompt: "Que fruta é esse?", answer: "Banana", wrongAnswers: ["Pera","Maça","Manga"]),
    
    Question(imageName: "kiwi", prompt: "Que fruta é esse?", answer: "Kiwi", wrongAnswers: ["Uva","Morango","Laranja"]),
    
    Question(imageName: "laranja", prompt: "Que fruta é esse?", answer: "Laranja", wrongAnswers: ["Uva","Melancia","Banana"]),
    
    Question(imageName: "maça", prompt: "Que fruta é esse?", answer: "Maça", wrongAnswers: ["Manga","Kiwi","Melancia"]),
    
    Question(imageName: "manga", prompt: "Que fruta é esse?", answer: "Manga", wrongAnswers: ["Abacaxi","Pera","Banana"]),
    
    Question(imageName: "melancia", prompt: "Que fruta é esse?", answer: "Melancia", wrongAnswers: ["Laranja","Morango","Pera"]),
    
    Question(imageName: "morango", prompt: "Que fruta é esse?", answer: "Morango", wrongAnswers: ["Manga","Pera","Maça"]),
    
    Question(imageName: "pera", prompt: "Que fruta é esse?", answer: "Pera", wrongAnswers: ["Kiwi","Laranja","Uva"]),
    
    Question(imageName: "uva", prompt: "Que fruta é esse?", answer: "Uva", wrongAnswers: ["Kiwi","Pera","Morango"]),
]

