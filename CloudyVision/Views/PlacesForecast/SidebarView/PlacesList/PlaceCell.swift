//
//  PlaceCell.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 15/10/2023.
//

import CoreLocation
import CVCore
import SwiftUI

struct PlaceCell: View {
    let place: Place

    var body: some View {
        VStack {
            HStack {
                Image(systemName: place.iconName)
                    .foregroundStyle(.accent)

                if place.isCurrentLocation {
                    Text("Current Location")
                } else {
                    Text(place.name)
                }
            }
            .font(.headline)
        }
    }
}

#Preview {
    PlaceCell(place: Place(name: "Paris", coordinate: Coordinates(from: CLLocation(latitude: 48.86, longitude: 2.35))))
}
