//
//  AccountView.swift
//  Parkify
//
//  Created by Md Razu Ahammed Molla on 4/5/2025.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // 🔹 User Profile Section
                VStack(spacing: 12) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.primaryColor)

                    Text("John Doe")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text("johndoe@example.com")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top)

                // 🔹 Options List
                List {
                    Section {
                        NavigationLink(destination: Text("Edit Profile")) {
                            Label("Edit Profile", systemImage: "pencil")
                        }

                        NavigationLink(destination: Text("Payment Methods")) {
                            Label("Payment Methods", systemImage: "creditcard")
                        }
                    }

                    Section {
                        Button(role: .destructive) {
                            appState.isLoggedIn = false // simulate logout
                        } label: {
                            Label("Logout", systemImage: "arrow.backward.square")
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("Account")
            .background(Color.white)
        }
        .background(Color.white)
    }
}

#Preview {
    AccountView()
}
