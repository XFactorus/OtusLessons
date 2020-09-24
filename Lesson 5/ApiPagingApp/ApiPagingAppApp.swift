//
//  ApiPagingAppApp.swift
//  ApiPagingApp
//
//  Created by Vladyslav Pokryshka on 22.09.2020.
//

import SwiftUI

@main
struct ApiPagingAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainScreen()
                .environmentObject(RMCharactersViewModel())
        }
    }
}
