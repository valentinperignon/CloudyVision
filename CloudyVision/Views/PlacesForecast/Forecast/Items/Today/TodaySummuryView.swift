//
//  TodaySummuryView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 24/10/2023.
//

import CVCore
import SwiftUI
import WeatherKit

struct TodaySummuryView: View {
    let currentWeather: CurrentWeather
    let today: DayWeather

    var body: some View {
        VStack(spacing: 8) {
            TemperatureView(temperature: currentWeather.temperature)
                .font(.system(size: 72))
                .padding(.bottom, 8)

            Text(currentWeather.condition.description)
                .font(.title)
                .foregroundStyle(.secondary)

            ExtremumTemperatureView(lowTemperature: today.lowTemperature, highTemperature: today.highTemperature)
                .font(.callout)
                .foregroundStyle(.tertiary)
        }
        .frame(maxWidth: .infinity)
    }
}
