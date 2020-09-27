//
//  ContentView.swift
//  ApiPagingApp
//
//  Created by Vladyslav Pokryshka on 22.09.2020.
//

import SwiftUI

struct MainScreen: View {
    
    @EnvironmentObject var rmViewModel: RMCharactersViewModel
    @EnvironmentObject var bbViewModel: BBCharactersViewModel
    
    @State private var selection: Int = 0
    
    var body: some View {
        NavControllerView()  {
            VStack {
                Picker("Options", selection: $selection) {
                    Text("Rick & Morty list").tag(0)
                    Text("Breaking Bad list").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                
                if selection == 0 {
                    RMCharactersListView()
                        .onAppear() {
                            self.rmViewModel.loadInitialList()
                        }
                } else {
                    BBCharactersListView()
                        .onAppear() {
                            self.bbViewModel.loadInitialList()
                        }
                }
            }.onAppear() {
                self.rmViewModel.loadInitialList()
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
