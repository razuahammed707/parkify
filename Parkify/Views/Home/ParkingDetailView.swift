//
//  ParkingDetailView.swift
//  Parkify
//
//
//  📄 Bottom sheet UI to show selected parking details and booking CTA.
//

import SwiftUI

struct ParkingDetailView: View {
    let spot: ParkingSpot

    var body: some View {
        VStack(spacing: 16) {
            Capsule()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 40, height: 5)
                .padding(.top, 8)

            // Image
            Image(spot.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 160)
                .clipped()
                .cornerRadius(12)
                .padding(.horizontal)

            // Title & Meta
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(spot.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("\(String(format: "%.1f", spot.distance)) km")
                        .foregroundColor(.secondary)
                }

                Text(spot.address)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                HStack {
                    Text("$\(String(format: "%.2f", spot.price_per_hour))/hr")
                        .fontWeight(.bold)
                        .foregroundColor(.primaryColor)
                    Spacer()
                    Label("4.4", systemImage: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            .padding(.horizontal)

            Spacer()

            Button(action: {
                // Booking action here
            }) {
                Text("Book Parking")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.primaryColor)
                    .cornerRadius(12)
            }
            .padding()
        }
        .background(Color(.systemBackground))
        .cornerRadius(24)
        .ignoresSafeArea()
    }
}
