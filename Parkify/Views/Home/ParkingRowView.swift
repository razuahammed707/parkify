
//  🪧 Description:
//  A vertically stacked row layout for a parking spot.
//  Used in the Nearby You section.
//

import SwiftUI

struct ParkingRowView: View {
    let spot: ParkingSpot

    var body: some View {
        HStack(spacing: 12) {
            // Image Thumbnail
            Image(spot.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 80)
                .cornerRadius(10)
                .clipped()

            VStack(alignment: .leading, spacing: 4) {
                Text(spot.title)
                    .font(.headline)
                    .lineLimit(1)

                Text(spot.address)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)

                HStack(spacing: 10) {
                    Text("$\(String(format: "%.2f", spot.price_per_hour))/hr")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.primaryColor)

                    Text("\(String(format: "%.1f", spot.distance)) km")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
