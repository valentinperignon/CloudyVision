//
//  FeelsLikeChartsView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 30/10/2023.
//

import Charts
import SwiftUI
import WeatherKit

extension HourWeather: Identifiable {
    public var id: Date { date }
}

struct FeelsLikeChartsView: View {
    @Environment(CloudyVisionModel.self) private var appModel

    var body: some View {
        Chart(appModel.selectedPlace?.weather?.hourlyForecast.forecast ?? []) { weather in
            BarMark(
                x: .value("Hour", weather.date.formatted(.dateTime.hour())),
                y: .value("Temperature", weather.apparentTemperature.value)
            )
        }
    }
}

#Preview {
    FeelsLikeChartsView()
}
