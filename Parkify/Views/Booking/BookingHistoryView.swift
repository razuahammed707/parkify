//
//  BookingHistoryView.swift
//  Parkify
//
//  Created by Md Razu Ahammed Molla on 4/5/2025.
//

import SwiftUI


struct BookingHistoryView: View {
    @EnvironmentObject var appState: AppState

    let bookings = [
        Booking(spotName: "Placeholder Spot 1", date: "2025-05-01", price: "$10"),
        Booking(spotName: "Placeholder Spot 2", date: "2025-04-30", price: "$12")
    ]

    var body: some View {
        NavigationStack {
            List(bookings) { booking in
                NavigationLink(destination: BookingDetailView(booking: booking)) {
                    VStack(alignment: .leading) {
                        Text(booking.spotName)
                            .font(.headline)
                        Text(booking.date)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 8)
                }
                .listRowBackground(Color.white) // 👈 Makes each cell white
            }
            .listStyle(PlainListStyle()) // Optional: removes extra padding
            .navigationTitle("Booking History")
            .background(Color.white)     // 👈 Makes entire list white
        }
        .background(Color.white)         // 👈 Makes outer view white
    }
}


#Preview {
    BookingHistoryView()
}
