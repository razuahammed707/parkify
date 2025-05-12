import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState

    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    @State private var rememberMe = false
    @State private var isLoading = false
    @State private var errorMessage: String?

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
                    Image("parkingsign")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .opacity(0.7)

                    Image(systemName: "car.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.black)
                        .offset(x: -20, y: 40)
                }
                .padding()

                Text("Sign in to Your Account")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)

                VStack(spacing: 16) {
                    TextField("Your Email Address", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)

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
                        // Add password reset logic
                    }
                    .font(.footnote)
                    .foregroundColor(Color.primaryColor)
                }
                .padding(.horizontal)

                if let error = errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.horizontal)
                }

                Button(action: {
                    Task {
                        isLoading = true
                        do {
                            try await SupabaseService.shared.login(email: email, password: password)
                            appState.isLoggedIn = true
                        } catch {
                            errorMessage = error.localizedDescription
                        }
                        isLoading = false
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
                .disabled(email.isEmpty || password.isEmpty)
                .padding(.horizontal)

                Spacer()
                Spacer()

                HStack {
                    Text("Don’t have an account?")
                        .foregroundColor(.secondary)
                    NavigationLink("Sign Up", destination: SignUpView())
                        .foregroundColor(Color.primaryColor)
                        .fontWeight(.semibold)
                }
                .font(.footnote)

                Spacer()
            }
            .padding(.top)
            .ignoresSafeArea(.keyboard)
        }
    }
}

#Preview {
    LoginView().environmentObject(AppState())
}
