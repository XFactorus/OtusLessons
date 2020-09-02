//
//  SecondScreen.swift
//  TestSwiftUI
//
//  Created by Vladyslav Pokryshka on 01.09.2020.
//  Copyright © 2020 Quantag IT Solutions. All rights reserved.
//

import SwiftUI

struct SecondScreen: View {
    @Binding var selection: Int
    
    var body: some View {
        Button(action :{
            self.selection = 0
        }) {
            Text("To First screen")
        }
        .background(Color.yellow)
    }
    
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen(selection: .constant(1))
    }
}
