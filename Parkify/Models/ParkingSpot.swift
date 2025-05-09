//
//  ParkingSpot.swift
//  Parkify
//
//  Created by Deep on 6/5/2025.
//

import Foundation
import CoreLocation
import MapKit

struct ParkingSpot: Identifiable, Codable {
    let id: UUID
    let title: String
    let location: GeoLocation
    let price_per_hour: Double
    let status: String
    let address: String
    let description: String
    let created_at: String
}

struct GeoLocation: Codable {
    let type: String
    let coordinates: [Double] // [longitude, latitude]
}

extension ParkingSpot {
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: location.coordinates[1], longitude: location.coordinates[0])
    }
}


extension ParkingSpot {
    var imageName: String {
        // Pick a random or derived image based on title hash
        let images = ["image1", "image2", "image3","image4","image5","image6","image7"]
        return images[abs(title.hashValue) % images.count]
    }
}

extension ParkingSpot {
    var distance: Double {
        // Temporary placeholder for UI (random value)
        return Double(Int.random(in: 0...10)) + Double.random(in: 0..<1)
    }
}
