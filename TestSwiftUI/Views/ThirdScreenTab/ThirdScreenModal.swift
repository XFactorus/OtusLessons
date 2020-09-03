//
//  ThirdScreenModal.swift
//  TestSwiftUI
//
//  Created by Vladyslav Pokryshka on 03.09.2020.
//  Copyright © 2020 Quantag IT Solutions. All rights reserved.
//

import SwiftUI

struct ThirdScreenModal: View {
    var body: some View {
        VStack {
            Text("Good work!")
                .font(.system(size:60))
            Image(systemName: "hand.thumbsup")
            .resizable()
                .aspectRatio(contentMode: .fit)
        }
    .padding()
    }
}

struct ThirdScreenModal_Previews: PreviewProvider {
    static var previews: some View {
        ThirdScreenModal()
    }
}
