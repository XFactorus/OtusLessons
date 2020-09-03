//
//  ThirdScreen.swift
//  TestSwiftUI
//
//  Created by Vladyslav Pokryshka on 03.09.2020.
//  Copyright © 2020 Quantag IT Solutions. All rights reserved.
//

import SwiftUI

struct ThirdScreen: View {
    @State private var modelViewShown: Bool = false
    
    var body: some View {
        Button(action: {
            self.modelViewShown.toggle()
        }) {
            Text("Touch me!")
        }
        .sheet(isPresented: self.$modelViewShown) {
            ThirdScreenModal()
        }
    }
}

struct ThirdScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThirdScreen()
    }
}
