//
//  SymbolDetail.swift
//  TestSwiftUI
//
//  Created by Vladyslav Pokryshka on 03.09.2020.
//  Copyright © 2020 Quantag IT Solutions. All rights reserved.
//

import SwiftUI

struct SymbolDetail: View {
    
    var symbol: SymbolModel
    var body: some View {
        VStack {
            Image(systemName: symbol.symbolName)
            .resizable()
                .aspectRatio(contentMode: .fit)
            Text(symbol.symbolDescription)
            .font(.system(size: 60))
        }
    .padding()
    }
}

struct SymbolDetail_Previews: PreviewProvider {
    static var previews: some View {
        SymbolDetail(symbol: symbolsData[4])
    }
}
