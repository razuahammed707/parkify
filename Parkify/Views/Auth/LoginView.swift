import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @State private var isLoading = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()

                Text("🚗 Parkify")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Login")
                    .font(.title2)

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                if let error = errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                }

                if isLoading {
                    ProgressView()
                }

                Button("Log In") {
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
                }
                .disabled(email.isEmpty || password.isEmpty)
                .buttonStyle(.borderedProminent)

                NavigationLink("Don't have an account? Sign Up", destination: SignupView())

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    LoginView().environmentObject(AppState())
}
