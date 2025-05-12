import SwiftUI

struct Booking: Identifiable {
    let id = UUID()
    let spotName: String
    let date: String
    let price: String
}

struct BookingDetailView: View {
    let booking: Booking
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                // Parking Details Card
                VStack(spacing: 16) {
                    HStack {
                        Image(systemName: "car.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                        Text("Parking Details")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        DetailRow(icon: "mappin.circle.fill", title: "Location", value: booking.spotName)
                        DetailRow(icon: "calendar", title: "Date", value: booking.date)
                        DetailRow(icon: "dollarsign.circle.fill", title: "Price", value: booking.price)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                        .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
                )
                
                // Additional Info Card
                VStack(spacing: 16) {
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                        Text("Additional Information")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        InfoRow(title: "Booking ID", value: String(booking.id.uuidString.prefix(8)))
                        InfoRow(title: "Status", value: "Confirmed")
                        InfoRow(title: "Payment Method", value: "Credit Card")
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                        .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
                )
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Booking Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailRow: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.blue)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(value)
                    .font(.body)
                    .fontWeight(.medium)
            }
            
            Spacer()
        }
    }
}

struct InfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .font(.body)
                .fontWeight(.medium)
        }
    }
}

#Preview {
    NavigationView {
        BookingDetailView(booking: Booking(
            spotName: "Downtown Parking Lot",
            date: "March 15, 2024",
            price: "$25.00"
        ))
    }
    .environment(\.colorScheme, .light) // Optional: light mode preview
}
