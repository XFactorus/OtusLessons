//
//  SecondScreenModel.swift
//  TestSwiftUI
//
//  Created by Vladyslav Pokryshka on 03.09.2020.
//  Copyright © 2020 Quantag IT Solutions. All rights reserved.
//

import Foundation

final class SymbolsData: ObservableObject {
    
    let symbolsList: [SymbolModel] = [SymbolModel(symbolDescription: "Phone device", symbolName: "phone"),
                                      SymbolModel(symbolDescription: "Microphone", symbolName: "mic"),
                                      SymbolModel(symbolDescription: "Right bubble", symbolName: "bubble.right"),
                                      SymbolModel(symbolDescription: "Bandage", symbolName: "bandage"),
                                      SymbolModel(symbolDescription: "Few guitars", symbolName: "guitars"),
                                      SymbolModel(symbolDescription: "Flame", symbolName: "flame"),
                                      SymbolModel(symbolDescription: "Car", symbolName: "car"),
                                      SymbolModel(symbolDescription: "Moon", symbolName: "moon"),
                                      SymbolModel(symbolDescription: "Bed", symbolName: "bed.double")]
    
    var selectedSymbol: SymbolModel = SymbolModel(symbolDescription: "Phone device", symbolName: "phone")
    
    @Published var randomSymbolSelected: Bool = false
    
    func selectRandomSymbol() {
        self.selectedSymbol = symbolsList.randomElement() ?? selectedSymbol
        self.randomSymbolSelected = true
    }
}


