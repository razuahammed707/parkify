import SwiftUI

struct AccountView: View {
    @EnvironmentObject var appState: AppState
    @AppStorage("email") private var email: String = "johndoe@example.com"

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Title
                Text("Account")
                    .font(.title)
                    .bold()
                    .padding(.top)

                // Profile Image
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.orange)

                // Email Display
                Text(email)
                    .foregroundColor(.orange)
                    .font(.subheadline)

                // Menu Options
                VStack(spacing: 0) {
                    // Edit Profile
                    NavigationLink(destination: EditProfileView()) {
                        HStack {
                            Image(systemName: "pencil")
                            Text("Edit Profile")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                    }

                    Divider()

                    // Payment Methods
                    NavigationLink(destination: PaymentMethodsView()) {
                        HStack {
                            Image(systemName: "creditcard")
                            Text("Payment Methods")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                    }
                }
                .background(Color.white)
                .cornerRadius(12)
                .padding(.horizontal)

                // Logout Button
                Button(role: .destructive) {
                    appState.isLoggedIn = false
                } label: {
                    HStack {
                        Image(systemName: "arrow.backward.square")
                        Text("Logout")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer()
            }
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}
