//
//  ServiceLocatorApp.swift
//  ServiceLocatorApp
//
//  Created by Vladyslav Pokryshka on 22.09.2020.
//

import SwiftUI

@main
struct ServiceLocatorApp: App {
    var body: some Scene {
        WindowGroup {
            MainScreen()
                .environmentObject(RMCharactersViewModel())
                .environmentObject(BBCharactersViewModel())
        }
    }
}
