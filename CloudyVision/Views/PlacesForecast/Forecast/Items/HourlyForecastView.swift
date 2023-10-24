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
            HStack(spacing: 32) {
                ForEach(hourlyForecast.lazy.prefix(24), id: \.date) { forecast in
                    HourForecastView(hourForecast: forecast)
                }
            }
            .padding(24)
        }
        .background(Material.thick)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
