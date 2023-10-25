//
//  HourForecastView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 24/10/2023.
//

import SwiftUI
import WeatherKit

struct HourWeatherView: View {
    let hourWeather: HourWeather

    var body: some View {
        VStack(spacing: 24) {
            TemperatureView(temperature: hourWeather.temperature)

            Image(systemName: "\(hourWeather.symbolName).fill")
                .symbolRenderingMode(.multicolor)

            Text(hourWeather.date, format: .dateTime.hour())
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}
