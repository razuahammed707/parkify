//
//  HomeView.swift
//  Parkify
//
//  Created by Md Razu Ahammed Molla on 4/5/2025.

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        VStack(spacing: 0) {

            // 🔹 Header
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .foregroundColor(.white)

                Spacer()

                VStack(spacing: 2) {
                    Text("Current Location")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))

                    Text("Sydney, NSW")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }

                Spacer()

                Image(systemName: "bell.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 20)
            .padding(.top, 60)
            .padding(.bottom, 16)
            .background(Color.primaryColor)

            // 🔸 Welcome text
            Text("Let’s find the best\nParking in Nearby You")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 20)

            // 🔍 Search bar
            SearchBarView(searchText: $viewModel.searchText)
                .padding(.horizontal, 20)
                .padding(.top, 10)

            // 🔁 Toggle between Map and List
            ViewToggleView(isMapView: $viewModel.isMapView)
                .padding(.horizontal, 20)
                .padding(.top, 10)

            // 🔄 Dynamic view: Map or List/Carousel
            if viewModel.isMapView {
                MapView(spots: viewModel.filteredSpots) { spot in
                    viewModel.selectedSpot = spot
                }
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                    .cornerRadius(16)
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Best Parking")
                            .font(.title3)
                            .fontWeight(.medium)
                            .padding(.horizontal, 20)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(viewModel.filteredSpots.prefix(5)) { spot in
                                    ParkingCardView(spot: spot)
                                        .onTapGesture {
                                            viewModel.selectedSpot = spot
                                        }
                                        .padding(.vertical, 5)
                                }
                            }
                            .padding(.horizontal, 20)
                        }

                        Text("Nearby You")
                            .font(.title3)
                            .fontWeight(.medium)
                            .padding(.horizontal, 20)

                        VStack(spacing: 16) {
                            ForEach(viewModel.filteredSpots) { spot in
                                ParkingRowView(spot: spot)
                                    .padding(.horizontal, 20)
                                    .onTapGesture {
                                        viewModel.selectedSpot = spot
                                    }
                            }
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .sheet(item: $viewModel.selectedSpot) { (spot: ParkingSpot) in
            ParkingDetailView(spot: spot)
                .presentationDetents([.height(500)])
        }

    }
}

#Preview {
    HomeView()
        .environmentObject(AppState())
}
