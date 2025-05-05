
//
//  SplashView.swift.swift
//  Parkify
//
//  Created by Md Razu Ahammed Molla on 4/5/2025.
//
import SwiftUI


import SwiftUI

struct SplashView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack {
            // Background color
            Color.primaryColor
                .ignoresSafeArea()

            VStack(spacing: 24) {
                Spacer()

                // Logo/Icon
                Image(systemName: "car.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)

                // App Name
                Text("Parkify")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                // Tagline
                Text("Smart Parking, Simplified.")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.85))

                Spacer()

                // Optional loading indicator
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.3)

                Spacer()
            }
            .padding()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                appState.isSplashDone = true
            }
        }
    }
}

#Preview {
    SplashView()
}
