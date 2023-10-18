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
    @State private var selectedPlace: Place?

    var body: some View {
        NavigationSplitView {
            SidebarView(selectedPlace: $selectedPlace)
        } detail: {
            ForecastView()
        }
        .onChange(of: selectedPlace) { _, newPlace in
            Task {
                if newPlace?.coordinate == nil {
                    do {
                        try await newPlace?.fetchCoordinate()
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
