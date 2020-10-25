//
//  ServiceLocatorApp.swift
//  ServiceLocatorApp
//
//  Created by Vladyslav Pokryshka on 22.09.2020.
//

import SwiftUI
import UIModule

@main
struct ServiceLocatorApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            MainScreen()
        }
    }
}
