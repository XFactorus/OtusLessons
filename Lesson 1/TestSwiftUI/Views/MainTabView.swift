//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Vladyslav Pokryshka on 27.08.2020.
//  Copyright © 2020 Quantag IT Solutions. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            FirstScreen(tabSelection: $tabSelection)
                .tabItem {
                    VStack {
                        Image(systemName: "ant")
                        Text("First")
                    }
            }
                
            .tag(0)
            
            SecondScreen()
                .tabItem {
                    VStack {
                        Image(systemName: "hare")
                        Text("Second")
                    }
            }
            .tag(1)
            
            ThirdScreen()
                .tabItem {
                    VStack {
                        Image(systemName: "tortoise")
                        Text("Third")
                    }
            }
            .tag(2)
        }
    }
}

struct MainTabViewPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            MainTabView().environmentObject(SymbolsData())
                .previewDevice(PreviewDevice(rawValue: "iPad SE"))
                .previewDisplayName("iPhone SE")
            
            MainTabView().environmentObject(SymbolsData())
                .previewDevice(PreviewDevice(rawValue: "iPad Air 2"))
                .previewDisplayName("iPad Air 2")
        }
    }
}
