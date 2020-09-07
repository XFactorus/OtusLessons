//
//  FirstScreen.swift
//  TestSwiftUI
//
//  Created by Vladyslav Pokryshka on 03.09.2020.
//  Copyright © 2020 Quantag IT Solutions. All rights reserved.
//

import SwiftUI

struct FirstScreen: View {
    
    @Binding var tabSelection: Int
    
    @EnvironmentObject var symbolsData: SymbolsData
    
    var body: some View {
        Button(action: {
            self.tabSelection = 1
            self.symbolsData.selectRandomSymbol()
        }) {
            Text("Open random symbol")
        }
    }
}

struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen(tabSelection: .constant(1))
    }
}
