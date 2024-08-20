//
//  ForecastView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 08/09/2023.
//

import CoreVisionKit
import OSLog
import SwiftUI

struct ForecastView: View {
    @State private var isLoading = false

    let place: Place

    var body: some View {
        ZStack {
            if let weather = place.weather {
                WeatherDataView(weather: weather)
            } else if isLoading {
                LoadingWeatherView()
            } else {
                ContentUnavailableView("Weather Unavailable", systemImage: "sun.max.trianglebadge.exclamationmark")
            }
        }
        .task {
            do {
                if place.coordinates == nil {
                    try await place.fetchCoordinate()
                }
                isLoading = true
                try await WeatherManager.shared.fetchWeather(for: place)
            } catch {
                Logger.placesForecast.error("Error when user changed selected place: \(error.localizedDescription)")
            }
            isLoading = false
        }
        .id(place)
        .navigationTitle(place.name)
    }
}

#Preview(windowStyle: .automatic) {
    ForecastView(place: .appleCampus)
}
