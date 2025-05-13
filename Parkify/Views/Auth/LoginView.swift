import SwiftUI

//struct LoginView: View {
//    @EnvironmentObject var appState: AppState
//
//    @State private var email: String = ""
//    @State private var password: String = ""
//    @State private var errorMessage: String?
//    @State private var isLoading = false
//
//    var body: some View {
//        NavigationStack {
//            VStack(spacing: 20) {
//                Spacer()
//
//                Text("🚗 Parkify")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//
//                Text("Login")
//                    .font(.title2)
//
//                TextField("Email", text: $email)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .keyboardType(.emailAddress)
//                    .autocapitalization(.none)
//
//                SecureField("Password", text: $password)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                if let error = errorMessage {
//                    Text(error)
//                        .foregroundColor(.red)
//                        .font(.caption)
//                }
//
//                if isLoading {
//                    ProgressView()
//                }
//
//                Button("Log In") {
//                    Task {
//                        isLoading = true
//                        do {
//                            try await SupabaseService.shared.login(email: email, password: password)
//                                appState.isLoggedIn = true
//                        } catch {
//                            errorMessage = error.localizedDescription
//                        }
//                        isLoading = false
//                    }
//                }
//                .disabled(email.isEmpty || password.isEmpty)
//                .buttonStyle(.borderedProminent)
//
//                NavigationLink("Don't have an account? Sign Up", destination: SignUpView())
//
//                Spacer()
//            }
//            .padding()
//        }
//    }
//}

// Create auth and splash view


import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    @State private var rememberMe = false
    @State private var isLoading = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // Back Button
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
                
                // Title
                Text("Sign in to Your Account")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                // Fields
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
                }
                .padding(.horizontal)
                
                // Remember Me & Forgot Password
                HStack {
                    Button(action: {
                        rememberMe.toggle()
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: rememberMe ? "checkmark.square.fill" : "square")
                                .foregroundColor(Color.primaryColor)
                            Text("Remember Me")
                                .foregroundColor(.primary)
                                .font(.footnote)
                        }
                    }
                    
                    Spacer()
                    
                    Button("Forgot Password") {
                        // Add action
                    }
                    .font(.footnote)
                    .foregroundColor(Color.primaryColor)
                }
                .padding(.horizontal)
                
                // Sign In Button
                Button(action: {
                    isLoading = true
                    // Simulate loading delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        isLoading = false
                        // Proceed with login logic
                    }
                }) {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.primaryColor)
                            .cornerRadius(16)
                    } else {
                        Text("Sign in")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.primaryColor)
                            .foregroundColor(.white)
                            .cornerRadius(16)
                    }
                }
                .padding(.horizontal)
                
                // Social Login
                Spacer()
                Spacer()
                
                // Bottom navigation
                HStack {
                    Text("Don’t have an account?")
                        .foregroundColor(.secondary)
                    Button("Sign Up") {
                        // Navigate to Sign Up
                    }
                    .foregroundColor(Color.primaryColor)
                    .fontWeight(.semibold)
                }
                .font(.footnote)
                
                Spacer()
            }
            .padding(.top)
        }
    }
}


#Preview {
    LoginView().environmentObject(AppState())
}
