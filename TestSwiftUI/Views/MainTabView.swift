//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Vladyslav Pokryshka on 27.08.2020.
//  Copyright © 2020 Quantag IT Solutions. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selection = 0
    
    
    var body: some View {
        TabView(selection: $selection) {
            Text("First View")
                .font(.title)
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
            Text("Third View")
                .font(.title)
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
        MainTabView()
    }
}
