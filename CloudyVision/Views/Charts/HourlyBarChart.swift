//
//  HourlyBarChart.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 30/10/2023.
//

import Charts
import SwiftUI
import WeatherKit

struct HourlyBarChart<Value: Plottable>: View {
    let forecast: [HourWeather]
    let yLabel: LocalizedStringKey
    let yData: KeyPath<HourWeather, Value>

    var body: some View {
        Chart(forecast) { weather in
            BarMark(
                x: .value("Hour", weather.date.formatted(.dateTime.hour())),
                y: .value(yLabel, weather[keyPath: yData])
            )
        }
        .chartYAxis {
            AxisMarks {
                AxisValueLabel()
                    .foregroundStyle(.primary)
                    .font(.title)
            }
        }
    }
}

#Preview {
    HourlyBarChart(forecast: [], yLabel: "Humidity", yData: \.humidity)
}
