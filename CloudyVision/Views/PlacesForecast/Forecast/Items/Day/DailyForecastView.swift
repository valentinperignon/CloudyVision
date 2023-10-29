//
//  DailyForecastView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 24/10/2023.
//

import CVCore
import SwiftUI
import WeatherKit

struct DailyForecastView: View {
    let dailyForecast: Forecast<DayWeather>

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: UIConstants.blocksSpacing) {
                ForEach(dailyForecast.lazy, id: \.date) { dayWeather in
                    DayWeatherView(dayWeather: dayWeather)
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(.horizontal, UIConstants.blocksSpacing, for: .scrollContent)
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.viewAligned)
    }
}
