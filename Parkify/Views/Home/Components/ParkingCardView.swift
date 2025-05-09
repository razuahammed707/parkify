//
//  ParkingCardView.swift
//  Parkify
//
//
//  🎴 Description:
//  A reusable card view showing key details of a ParkingSpot for carousel display.
//

import SwiftUI

struct ParkingCardView: View {
    let spot: ParkingSpot

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Image
            Image(spot.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 140)
                .clipped()
                .cornerRadius(6)

            VStack(alignment: .leading, spacing: 4) {
                Text(spot.title)
                    .font(.headline)
                    .lineLimit(1)

                Text(spot.address)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)

                HStack {
                    Text("$\(String(format: "%.2f", spot.price_per_hour))/hr")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.primaryColor)

                    Spacer()

                    Text("\(String(format: "%.1f", spot.distance)) km")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding([.horizontal, .bottom], 8)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
        .frame(width: 200)
    }
}
