//
//  SecondScreen.swift
//  TestSwiftUI
//
//  Created by Vladyslav Pokryshka on 01.09.2020.
//  Copyright © 2020 Quantag IT Solutions. All rights reserved.
//

import SwiftUI

struct SecondScreen: View {
    
    var body: some View {
        NavigationView {
            List {
                ForEach(symbolsData, id: \.symbolName) { symbol in
                    NavigationLink(destination: SymbolDetail(symbol: symbol)) {
                        SymbolRow(selectedSymbol: symbol)
                    }
                }  .navigationBarTitle("Symbols list")
            }
        }
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}
