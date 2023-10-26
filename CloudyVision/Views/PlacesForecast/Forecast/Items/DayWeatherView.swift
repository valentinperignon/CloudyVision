//
//  DayWeatherView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 24/10/2023.
//

import SwiftUI
import WeatherKit

struct DayWeatherView: View {
    let dayWeather: DayWeather

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(dayWeather.date, format: .dateTime.weekday().day().month())
                .font(.headline)
                .padding(.bottom, 4)

            HStack {
                WeatherSymbolView(symbolName: dayWeather.symbolName)

                Text(dayWeather.condition.description)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(24)
        .background(Material.regular)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
