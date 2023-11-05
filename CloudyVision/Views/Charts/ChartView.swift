//
//  ChartView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 30/10/2023.
//

import CoreVisionKit
import SwiftUI
import WeatherKit

extension HourWeather: Identifiable {
    public var id: Date { date }
}

struct ChartView: View {
    @Environment(CloudyVisionModel.self) private var appModel

    let chartType: ChartType

    private var hourlyForecast: [HourWeather] {
        appModel.selectedPlace?.weather?.hourlyForecast.forecast ?? []
    }

    var body: some View {
        VStack(spacing: 32) {
            switch chartType {
            case .feelsLike:
                HourlyLineChart(forecast: hourlyForecast, yLabel: "Temperature", yData: \.apparentTemperature.value)
            case .precipitations:
                HourlyBarChart(forecast: hourlyForecast, yLabel: "Precipitation", yData: \.precipitationAmount.value)
            case .uvIndex:
                HourlyLineChart(forecast: hourlyForecast, yLabel: "Humidity", yData: \.uvIndex.value)
            case .humidity:
                HourlyBarChart(forecast: hourlyForecast, yLabel: "Humidity", yData: \.humidity)
            case .visibility:
                HourlyLineChart(forecast: hourlyForecast, yLabel: "Distance", yData: \.visibility.value)
            }

            ChartTitleView(title: chartType.title)
        }
    }
}

#Preview {
    ChartView(chartType: .feelsLike)
}
