//
//  MainTabView.swift
//  Parkify
//
//  Created by Md Razu Ahammed Molla on 4/5/2025.
//

import SwiftUI

struct MainTabView: View {
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemGray6

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            BookingHistoryView()
                .tabItem {
                    Label("Bookings", systemImage: "clock")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
        .accentColor(.primaryColor) 
    }
}


#Preview {
    MainTabView()
}
