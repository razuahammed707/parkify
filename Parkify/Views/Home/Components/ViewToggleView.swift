//
//  ViewToggleView.swift
//  Parkify
//
//  📄 Description:
//  Modern, animated toggle between List View and Map View
//

import SwiftUI

struct ViewToggleView: View {
    @Binding var isMapView: Bool

    private let options = ["List", "Map"]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<options.count, id: \.self) { index in
                let selected = (isMapView && index == 1) || (!isMapView && index == 0)

                Button(action: {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        isMapView = (index == 1)
                    }
                }) {
                    Text(options[index])
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(selected ? .white : .gray)
                        .background(
                            ZStack {
                                if selected {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.primaryColor)
                                        .matchedGeometryEffect(id: "toggle", in: namespace)
                                }
                            }
                        )
                }
            }
        }
        .frame(height: 40)
        .padding(4)
        .background(Color(.systemGray5))
        .cornerRadius(10)
    }

    @Namespace private var namespace
}
