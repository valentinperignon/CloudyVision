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
    @Environment(CloudyVisionModel.self) private var appModel

    var body: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            ForecastView(place: appModel.selectedPlace ?? .appleCampus)
        }
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
