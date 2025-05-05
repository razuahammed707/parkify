//
//  HomeView.swift
//  Parkify
//
//  Created by Md Razu Ahammed Molla on 4/5/2025.
//
import SwiftUI


struct HomeView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
    
        VStack(spacing: 0) {
            // 🔹 Header
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .foregroundColor(.white)

                Spacer()

                VStack(spacing: 2) {
                    Text("Current Location")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))

                    Text("Sydney, NSW")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }

                Spacer()
            }
            .padding(20)
            .background(Color.primaryColor)

            Text("Lets find the best Parking in Nearly you")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            
            
            Spacer() // ✅ Now this spacer is properly placed

        }
    }

}

#Preview {
    HomeView()
}
