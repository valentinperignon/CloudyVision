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

            WeatherSymbolView(symbolName: hourWeather.symbolName)

            Group {
                if Calendar.current.isDate(hourWeather.date, equalTo: .now, toGranularity: .hour) {
                    Text("Now")
                } else {
                    Text(hourWeather.date, format: .dateTime.hour())
                }
            }
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 24)
    }
}
