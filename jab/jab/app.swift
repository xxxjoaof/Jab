//
//  ContentView.swift
//  jab
//
//  Created by João Pedro França on 06/05/23.
//

import SwiftUI

@main
struct jabApp: App {
    var body: some Scene {
        WindowGroup {
            FruitView(question: database4.first!)
        }
    }
}
