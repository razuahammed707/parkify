import SwiftUI

struct TermsAgreementModal: View {
    @Binding var showModal: Bool

    var body: some View {
        VStack(spacing: 16) {
            Text("I agree to the ")
                .font(.body)
                .foregroundColor(.primary) +
            Text("Terms of Service").foregroundColor(Color("AccentColor")) +
            Text(" and ") +
            Text("Conditions of Use").foregroundColor(Color("AccentColor")) +
            Text(", including consent to electronic communications and I affirm that the information provided is my own.")
                .font(.body)
                .foregroundColor(.primary)

            Button("Agree") {
                showModal = false
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("AccentColor"))
            .foregroundColor(.white)
            .cornerRadius(16)

            Button("Disagree") {
                showModal = false
            }
            .foregroundColor(.red)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .padding()
    }
}

