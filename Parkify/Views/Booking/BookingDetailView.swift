
//
//  Untitled.swift
//  Parkify
//
//  Created by Md Razu Ahammed Molla on 4/5/2025.
//

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
        VStack(spacing: 16) {
            Text("Parking Spot:")
                .font(.headline)
            Text(booking.spotName)
                .font(.title2)

            Text("Date:")
                .font(.headline)
            Text(booking.date)

            Text("Price:")
                .font(.headline)
            Text(booking.price)
        }
        .padding()
        .navigationTitle("Booking Details")
    }
}
