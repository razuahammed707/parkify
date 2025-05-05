//
//  ParkifyApp.swift
//  Parkify
//
//  Created by Md Razu Ahammed Molla on 4/5/2025.
//

import SwiftUI

@main
struct ParkifyApp: App {
    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            RootView()
               .environmentObject(appState)
        }
    }
}
