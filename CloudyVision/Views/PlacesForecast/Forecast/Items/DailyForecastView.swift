//
//  DailyForecastView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 24/10/2023.
//

import SwiftUI
import WeatherKit

struct DailyForecastView: View {
    let dailyForecast: Forecast<DayWeather>

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 24) {
                ForEach(dailyForecast.lazy.prefix(11).dropFirst(), id: \.date) { dayWeather in
                    DayWeatherView(dayWeather: dayWeather)
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(.horizontal, 24, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
    }
}
