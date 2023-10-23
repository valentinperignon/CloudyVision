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
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                locationManager.requestLocationIfPossible()
                Task {
                    do {
                        try await WeatherManager.shared.refreshWeather()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        .onChange(of: selectedPlace) {
            Task {
                if selectedPlace?.coordinates == nil {
                    do {
                        try await selectedPlace?.fetchCoordinate()
                    } catch {
                        Logger.placesForecast.error("Error while fetching cordinates")
                    }
                }
            }
        }
    }
}

#Preview {
    PlacesForecastView()
}
