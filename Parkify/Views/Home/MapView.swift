//
//  MapView.swift
//  Parkify
//
//  Created by [Your Name] on [Date]
//
//  🗺️ Description:
//  Displays all parking spots on a map with interactive annotations for iOS 17+.
//

import SwiftUI
import MapKit

struct MapView: View {
    let spots: [ParkingSpot]
    let onSpotTap: (ParkingSpot) -> Void

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -33.8688, longitude: 151.2093),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )

    var body: some View {
        Map(initialPosition: .region(region)) {
            ForEach(spots) { spot in
                Annotation(spot.title, coordinate: spot.coordinate) {
                    VStack {
                        Image(systemName: "car.fill")
                            .foregroundColor(.white)
                            .padding(6)
                            .background(Color.primaryColor)
                            .clipShape(Circle())

                        Text(spot.title)
                            .font(.caption)
                            .foregroundColor(.primary)
                            .lineLimit(1)
                    }
                    .onTapGesture {
                        onSpotTap(spot)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
