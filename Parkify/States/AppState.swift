//
//  AppState.swift
//  Parkify
//
//  Created by Md Razu Ahammed Molla on 4/5/2025.
//

import Foundation

class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var isSplashDone: Bool = false
    
    init() {
        self.isLoggedIn = SupabaseService.shared.isUserLoggedIn()
    }
}
