//
//  HomeViewModel.swift
//  Parkify
//
//
//  🧠 Description:
//  The ViewModel for HomeView. Responsible for:
//  - Loading parking data (from JSON or API in the future)
//  - Filtering search results
//  - Managing toggle between Map and List views.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    // MARK: - Published Properties (UI reactive)
    @Published var searchText: String = ""
    @Published var isMapView: Bool = false
    @Published var spots: [ParkingSpot] = []
    @Published var selectedSpot: ParkingSpot? = nil


    // MARK: - Filtered Spots (computed)
    var filteredSpots: [ParkingSpot] {
        if searchText.isEmpty {
            return spots
        } else {
            return spots.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.address.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    // MARK: - Init
    init() {
        loadDummyData()
    }

    // MARK: - Data Loading
    private func loadDummyData() {
        guard let url = Bundle.main.url(forResource: "parking_dummy_data_sydney", withExtension: "json") else {
            print("❌ JSON file not found in bundle.")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([ParkingSpot].self, from: data)
            self.spots = decoded
        } catch {
            print("❌ Failed to decode parking data: \(error)")
        }
    }
}
