//
//  HourForecastView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 24/10/2023.
//

import SwiftUI
import WeatherKit

struct HourForecastView: View {
    let hourForecast: HourWeather

    var body: some View {
        VStack(spacing: 24) {
            TemperatureView(temperature: hourForecast.temperature)

            Image(systemName: "\(hourForecast.symbolName).fill")
                .symbolRenderingMode(.multicolor)

            Text(hourForecast.date, format: .dateTime.hour())
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}
