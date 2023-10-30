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

    @State private var forecastModel = ForecastModel()

    var body: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            ForecastView(place: forecastModel.selectedPlace ?? .appleCampus)
        }
        .environment(forecastModel)
        .task {
            await refreshWeather()
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                locationManager.requestLocationIfPossible()
                Task {
                    await refreshWeather()
                }
            }
        }
    }

    private func refreshWeather() async {
        do {
            try await WeatherManager.shared.refreshWeather()
        } catch {
            Logger.placesForecast.error("Error while refreshing weather")
        }
    }
}

#Preview {
    PlacesForecastView()
}
