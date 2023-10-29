//
//  HourlyForecastView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 24/10/2023.
//

import SwiftUI
import WeatherKit

struct HourlyForecastView: View {
    let hourlyForecast: Forecast<HourWeather>

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(hourlyForecast.lazy.prefix(24), id: \.date) { hourWeather in
                    HourWeatherView(hourWeather: hourWeather)
                }
            }
        }   
        .forecastItem()
    }
}
