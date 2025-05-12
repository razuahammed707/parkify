import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isPasswordVisible = false
    @State private var isConfirmPasswordVisible = false
    @State private var showModal = false
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var isLoading = false
    @State private var navigateToHome = false

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
                
                // App Icon and Name
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

                Text("Parkify")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(Color.primaryColor)

                Text("Sign Up")
                    .font(.title3)
                    .fontWeight(.semibold)

                // Form Fields
                VStack(spacing: 16) {
                    TextField("Your Email Address", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)

                    passwordField(title: "Your Password", text: $password, isVisible: $isPasswordVisible)
                    passwordField(title: "Confirm Your Password", text: $confirmPassword, isVisible: $isConfirmPasswordVisible)
                }
                .padding(.horizontal)

                if showError {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.footnote)
                        .padding(.horizontal)
                }

                // Sign Up Button
                Button(action: handleSignUp) {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    } else {
                        Text("Sign Up")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.primaryColor)
                .foregroundColor(.white)
                .cornerRadius(16)
                .padding(.horizontal)

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

                // Navigation to home after success
                NavigationLink("", destination: HomeView(), isActive: $navigateToHome)
            }
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showModal) {
            TermsAgreementModal(showModal: $showModal)
        }
    }

    // MARK: - Helper

    func handleSignUp() {
        guard password == confirmPassword else {
            showError = true
            errorMessage = "Passwords do not match."
            return
        }

        isLoading = true
        Task {
            do {
                try await SupabaseService.shared.signUp(email: email, password: password)
                isLoading = false
                navigateToHome = true
            } catch {
                isLoading = false
                showError = true
                errorMessage = error.localizedDescription
            }
        }
    }

    func passwordField(title: String, text: Binding<String>, isVisible: Binding<Bool>) -> some View {
        HStack {
            if isVisible.wrappedValue {
                TextField(title, text: text)
            } else {
                SecureField(title, text: text)
            }
            Button {
                isVisible.wrappedValue.toggle()
            } label: {
                Image(systemName: isVisible.wrappedValue ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
            }
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
