//
//  ContentView.swift
//  ApiPagingApp
//
//  Created by Vladyslav Pokryshka on 22.09.2020.
//

import SwiftUI

struct MainScreen: View {
    
    @EnvironmentObject var viewModel: RMCharactersViewModel
    
    @State private var selection: Int = 0
    
    var body: some View {
        NavControllerView(transition: .custom(.slide))  {
            VStack {
                Picker("Options", selection: $selection) {
                    Text("Rick & Morty list").tag(0)
                    Text("Two Column").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                
                if selection == 0 {
                    RMCharactersListView()
                        .onAppear() {
                            self.viewModel.fetchPage()
                        }
                }
            }.onAppear() {
                self.viewModel.fetchPage() // first page
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            .environmentObject(RMCharactersViewModel(isMock: true))
    }
}
