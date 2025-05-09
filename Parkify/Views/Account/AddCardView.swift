import SwiftUI

struct AddCardView: View {
    @Binding var cards: [PaymentCard]
    @Environment(\.dismiss) var dismiss

    @State private var cardNumber = ""
    @State private var cardHolder = ""
    @State private var expiry = ""
    @State private var cvv = ""
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Add New Card")
                .font(.title2)
                .bold()
                .padding(.top)

            Group {
                TextField("Card Number", text: $cardNumber)
                    .keyboardType(.numberPad)

                TextField("Card Holder Name", text: $cardHolder)

                TextField("Expired", text: $expiry)
                    .keyboardType(.numbersAndPunctuation)

                TextField("CVV Code", text: $cvv)
                    .keyboardType(.numberPad)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)

            Spacer()

            Button(action: {
                if !isValidCard(cardNumber) {
                    alertMessage = "Invalid card number. Please check and try again."
                    showAlert = true
                    return
                }

                let newCard = PaymentCard(
                    type: cardNumber.hasPrefix("5") ? "Mastercard" : "Visa",
                    number: formatCard(cardNumber),
                    holder: cardHolder,
                    expiry: expiry
                )
                cards.append(newCard)
                dismiss()
            }) {
                Text("Add Card")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    func formatCard(_ number: String) -> String {
        let cleaned = number.filter(\.isNumber)
        return stride(from: 0, to: cleaned.count, by: 4).map {
            let start = cleaned.index(cleaned.startIndex, offsetBy: $0)
            let end = cleaned.index(start, offsetBy: 4, limitedBy: cleaned.endIndex) ?? cleaned.endIndex
            return String(cleaned[start..<end])
        }.joined(separator: " ")
    }

    func isValidCard(_ number: String) -> Bool {
        let trimmed = number.filter(\.isNumber)
        guard trimmed.count >= 12 else { return false }

        var sum = 0
        let reversed = trimmed.reversed().map { Int(String($0)) ?? 0 }

        for (i, digit) in reversed.enumerated() {
            if i % 2 == 1 {
                let doubled = digit * 2
                sum += doubled > 9 ? doubled - 9 : doubled
            } else {
                sum += digit
            }
        }
        return sum % 10 == 0
    }
}
