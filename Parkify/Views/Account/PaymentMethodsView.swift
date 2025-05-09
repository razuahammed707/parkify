import SwiftUI

struct PaymentMethodsView: View {
    @State private var cards: [PaymentCard] = [
        PaymentCard(type: "Visa", number: "5214 4321 5678 4345", holder: "RobertFox", expiry: "10/22"),
        PaymentCard(type: "Mastercard", number: "5214 4321 5678 4345", holder: "RobertFox", expiry: "10/22")
    ]
    @State private var showAddCard = false
    @State private var showDeleteAlert = false
    @State private var indexSetToDelete: IndexSet?

    var body: some View {
        NavigationStack {
            VStack {
                Text("My Payment")
                    .font(.title2)
                    .bold()
                    .padding(.top)

                List {
                    ForEach(cards, id: \.id) { card in
                        CardView(card: card)
                    }
                    .onDelete { indexSet in
                        indexSetToDelete = indexSet
                        showDeleteAlert = true
                    }
                }
                .listStyle(PlainListStyle())

                Spacer()

                Button(action: {
                    showAddCard = true
                }) {
                    Text("Add New Card")
                        .foregroundColor(.orange)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.orange, lineWidth: 1))
                }
                .padding(.horizontal)
                .padding(.bottom)
                .navigationDestination(isPresented: $showAddCard) {
                    AddCardView(cards: $cards)
                }
            }
            .background(Color(UIColor.systemGray6))
            .alert("Delete Card?", isPresented: $showDeleteAlert, actions: {
                Button("Delete", role: .destructive) {
                    if let indexSet = indexSetToDelete {
                        deleteCard(at: indexSet)
                        indexSetToDelete = nil
                    }
                }
                Button("Cancel", role: .cancel) {
                    indexSetToDelete = nil
                }
            }, message: {
                Text("Are you sure you want to delete this card?")
            })
        }
    }

    func deleteCard(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
    }
}
// MARK: - PaymentCard Model
struct PaymentCard: Identifiable, Equatable {
    var id = UUID()
    var type: String
    var number: String
    var holder: String
    var expiry: String
}

// MARK: - Card Display View
struct CardView: View {
    var card: PaymentCard

    var logo: String {
        switch card.type.lowercased() {
        case "visa": return "v.circle"
        case "mastercard": return "m.circle"
        default: return "creditcard"
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Universal Card")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: logo)
                    .foregroundColor(.blue)
            }

            Text(card.number)
                .font(.title3)
                .bold()
                .foregroundColor(.orange)

            HStack {
                Text(card.holder)
                    .font(.subheadline)
                Spacer()
                Text(card.expiry)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 1)
    }
}
