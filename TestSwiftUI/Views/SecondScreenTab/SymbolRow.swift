//
//  SymbolRow.swift
//  TestSwiftUI
//
//  Created by Vladyslav Pokryshka on 03.09.2020.
//  Copyright © 2020 Quantag IT Solutions. All rights reserved.
//

import SwiftUI

struct SymbolRow: View {
    var selectedSymbol: SymbolModel
    
    var body: some View {
        HStack {
            Text(selectedSymbol.symbolDescription)
            Spacer()
            Image(systemName: selectedSymbol.symbolName)
        }
    .padding()
    }
}

struct SymbolRow_Previews: PreviewProvider {
    static var previews: some View {
        SymbolRow(selectedSymbol: symbolsData[0])
    }
}
