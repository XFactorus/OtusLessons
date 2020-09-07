//
//  SecondScreen.swift
//  TestSwiftUI
//
//  Created by Vladyslav Pokryshka on 01.09.2020.
//  Copyright © 2020 Quantag IT Solutions. All rights reserved.
//

import SwiftUI

struct SecondScreen: View {
    
    @EnvironmentObject var symbolsData: SymbolsData
    @State private var openSymbolSelectionState: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SymbolDetail(symbol: symbolsData.selectedSymbol), isActive: $openSymbolSelectionState) {
                    EmptyView()
                }.hidden()
                
                List {
                    ForEach(SymbolsData().symbolsList, id: \.symbolName) { symbol in
                        NavigationLink(destination: SymbolDetail(symbol: symbol)) {
                            SymbolRow(selectedSymbol: symbol)
                        }
                    }
                }
                
            }.navigationBarTitle("Symbols list")
            
        }.onAppear {
            if self.symbolsData.randomSymbolSelected {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.openSymbolSelectionState = true
                    self.symbolsData.randomSymbolSelected = false
                }
            } else {
                self.openSymbolSelectionState = false
            }
        }.onDisappear() {
            self.openSymbolSelectionState = false

        }
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen().environmentObject(SymbolsData())
    }
}
