import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isPasswordVisible = false
    @State private var isConfirmPasswordVisible = false
    @State private var showModal = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // Header
                HStack {
                    NavigationLink(destination: FinalOnboardingView()) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .padding(.leading)
                            .foregroundColor(.primary)
                    }
                    Spacer()
                }
                
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
                
                Text("Sign Up")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                // Form Fields
                VStack(spacing: 16) {
                    TextField("Your Email Address", text: $email)
                        .textFieldStyle(.roundedBorder)
                    
                    HStack {
                        if isPasswordVisible {
                            TextField("Your Password", text: $password)
                        } else {
                            SecureField("Your Password", text: $password)
                        }
                        Button {
                            isPasswordVisible.toggle()
                        } label: {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    
                    
                    HStack {
                        if isConfirmPasswordVisible {
                            TextField("Confirm Your Password", text: $confirmPassword)
                        } else {
                            SecureField("Confirm Your Password", text: $confirmPassword)
                        }
                        Button {
                            isConfirmPasswordVisible.toggle()
                        } label: {
                            Image(systemName: isConfirmPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                Spacer()
                
                // Sign Up Button
                Button(action: {}) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.primaryColor)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                }
                .padding(.horizontal)
                
                
                
                Spacer()
                
                Spacer()
                
                
                HStack(spacing: 4) {
                    Text("Already have an account?")
                        .foregroundColor(.secondary)

                    NavigationLink(destination: LoginView()) {
                        Text("Sign In")
                            .foregroundColor(Color.primaryColor)
                            .fontWeight(.semibold)
                    }
                }
                .font(.footnote)
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        
        .sheet(isPresented: $showModal) {
            TermsAgreementModal(showModal: $showModal)
        }
    }
}
#Preview {
    SignUpView()
}
