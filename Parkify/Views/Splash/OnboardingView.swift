import SwiftUI

struct OnboardingView: View {
    @State private var showNextScreen = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("parking_bg")
                    .resizable()
                //.scaledToFill()
                    .ignoresSafeArea()
                
                // Dark overlay
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                
                // Bottom Card
                VStack {
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 16) {
                        // Page indicator
                        HStack(spacing: 8) {
                            Circle().fill(Color.primaryColor).frame(width: 10, height: 6)
                            Circle().fill(Color.gray.opacity(0.4)).frame(width: 6, height: 6)
                            Circle().fill(Color.gray.opacity(0.4)).frame(width: 6, height: 6)
                        }
                        
                        // Title
                        Text("Make it easier for\nyourself to find parking")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.primary)
                        
                        // Description
                        Text("Access live availability, reserve spots, and manage your parking — all in one place.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                        
                        // Continue Button
                        Button(action: {
                            showNextScreen = true
                        }) {
                            Text("Continue")
                                .fontWeight(.semibold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.primaryColor)
                                .foregroundColor(.white)
                                .cornerRadius(16)
                        }
                        .padding(.horizontal)
                        
                    }
                    .padding(.vertical, 24)
                    .padding(.horizontal)
                    .background(Color(.systemBackground))
                    .cornerRadius(28)
                    .padding()
                    
                }
                
                .ignoresSafeArea(edges: .bottom)
                
                }
            .navigationDestination(isPresented: $showNextScreen) {
                FinalOnboardingView()
            }
        }
    }
}

#Preview {
    OnboardingView()
}




