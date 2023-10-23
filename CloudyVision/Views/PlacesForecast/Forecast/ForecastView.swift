//
//  ForecastView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 08/09/2023.
//

import CVCore
import SwiftUI

struct ForecastView: View {
    let place: Place

    var body: some View {
        Group {
            if let weather = place.weather {
                ScrollView {
                    VStack {
                        TemperatureView(temperature: weather.currentWeather.temperature)
                            .font(.extraLargeTitle)

                        if let today = weather.dailyForecast.first {
                            Text(today.condition.description)
                                .font(.title)

                            ExtremumTemperatureView(lowTemperature: today.lowTemperature, highTemperature: today.highTemperature)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            } else {
                ContentUnavailableView("Data Unavailable", systemImage: "sun.max.trianglebadge.exclamationmark")
            }
        }
        .onAppear {
            Task {
                try await WeatherManager.shared.fetchWeather(for: place)
            }
        }
        .onChange(of: place.coordinates) {
            Task {
                try await WeatherManager.shared.fetchWeather(for: place)
            }
        }
        .padding()
        .navigationTitle(place.name)
    }
}

#Preview(windowStyle: .automatic) {
    ForecastView(place: .appleCampus)
}
