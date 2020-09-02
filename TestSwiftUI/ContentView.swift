//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Vladyslav Pokryshka on 27.08.2020.
//  Copyright © 2020 Quantag IT Solutions. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    
    var body: some View {
        TabView(selection: $selection) {
            Text("First View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "globe")
                        Text("First")
                    }
            }
                
            .tag(0)
            
            SecondScreen(selection: $selection)
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "moon")
                        Text("Second")
                    }
            }
            .tag(1)
            Text("Third View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "globe")
                        Text("Third")
                    }
            }
            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
