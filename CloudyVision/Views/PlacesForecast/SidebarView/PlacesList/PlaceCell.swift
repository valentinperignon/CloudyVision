//
//  PlaceCell.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 15/10/2023.
//

import CoreLocation
import CoreVisionKit
import SwiftUI

struct PlaceCell: View {
    let place: Place

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
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

                if let todayWeather = place.weather?.today {
                    ExtremumTemperatureView(lowTemperature: todayWeather.lowTemperature, highTemperature: todayWeather.highTemperature)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            Spacer()

            if let currentTemperature = place.weather?.currentWeather.temperature {
                TemperatureView(temperature: currentTemperature)
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    PlaceCell(place: Place(name: "Paris", coordinate: Coordinates(from: CLLocation(latitude: 48.86, longitude: 2.35))))
}
