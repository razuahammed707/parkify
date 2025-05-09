//
//  FinalOnboardingView.swift
//  Parkify
//
//  Created by Aya Issa on 7/5/2025.
//

import SwiftUI

struct FinalOnboardingView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("parking_bg") // Add this second image to Assets
                    .resizable()
                //.scaledToFill()
                    .ignoresSafeArea()
                
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer(minLength: 0)
                    
                    
                    VStack(spacing: 16) {
                        Text("Make it easier for\nyourself to find parking")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.primary)
                        
                        Text("Access live availability, reserve spots, and manage your parking — all in one place.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Get Started")
                                .fontWeight(.semibold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.primaryColor)
                                .foregroundColor(.white)
                                .cornerRadius(16)
                        }
                        .padding(.horizontal)
                        
                        NavigationLink(destination: SignUpView()) {
                            HStack(spacing: 4) {
                                Text("Don’t have an account?")
                                    .foregroundColor(.primary)
                                Text("Register")
                                    .foregroundColor(Color.primaryColor)
                            }
                        }
                        .font(.footnote)
                    }
                    .padding(.vertical, 24)
                    .padding(.horizontal)
                    .background(Color(.systemBackground))
                    .cornerRadius(28)
                    .padding()
                }
                .ignoresSafeArea(edges: .bottom)
            }
            
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    FinalOnboardingView()
}
