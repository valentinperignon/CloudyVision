//
//  PlacesForecastView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 09/09/2023.
//

import CVCore
import OSLog
import SwiftUI

struct PlacesForecastView: View {
    @Environment(\.scenePhase) private var scenePhase
    @Environment(LocationManager.self) private var locationManager

    @State private var selectedPlace: Place?

    var body: some View {
        NavigationSplitView {
            SidebarView(selectedPlace: $selectedPlace)
        } detail: {
            ForecastView(place: selectedPlace ?? .appleCampus)
        }
        .task {
            do {
                try await WeatherManager.shared.refreshWeather()
            } catch {
                Logger.placesForecast.error("Error while refreshing weather")
            }
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                locationManager.requestLocationIfPossible()
                Task {
                    do {
                        try await WeatherManager.shared.refreshWeather()
                    } catch {
                        Logger.placesForecast.error("Error while refreshing weather")
                    }
                }
            }
        }
        .onChange(of: selectedPlace) {
            Task {
                guard let selectedPlace else { return }

                do {
                    if selectedPlace.coordinates == nil {
                        try await selectedPlace.fetchCoordinate()
                    }
                    try await WeatherManager.shared.fetchWeather(for: selectedPlace)
                } catch {
                    Logger.placesForecast.error("Error when user changed selected place: \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    PlacesForecastView()
}
