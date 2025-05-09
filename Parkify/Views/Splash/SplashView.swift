
//
//  SplashView.swift.swift
//  Parkify
//
//  Created by Md Razu Ahammed Molla on 4/5/2025.
//
//import SwiftUI


import SwiftUI

struct SplashView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack {
            // Background color
            Color(.white)
                .ignoresSafeArea()

            VStack(spacing: 24) {
                Spacer()

                // Logo/Icon
                ZStack {
                    // Background icon
                    Image("parkingsign")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .opacity(0.7)

                    // Foreground icon (car), slightly below the center
                    Image(systemName: "car.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.black)
                        .offset(x: -20, y: 40)
                        // Push it downward slightly
                }
                .padding()
                
                //Spacer()

                // App Name
                Text("Parkify")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(Color.primaryColor)

                // Tagline
        
                Spacer()

                // Optional loading indicator
                VStack(spacing: 4) {
                    
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.primaryColor))
                        .scaleEffect(1.3)
                        .padding()
                    
                    
                    Text("v1.0")
                        .font(.caption)
                        .foregroundColor(Color.primaryColor)
                    
                    
                    Text("Smart Parking, Simplified.")
                        .font(.headline)
                        .foregroundColor(Color.primaryColor.opacity(0.85))
                }
                .padding(.bottom, 30)
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
        .environmentObject(AppState())
}
