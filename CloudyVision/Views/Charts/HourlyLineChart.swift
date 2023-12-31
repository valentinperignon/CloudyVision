//
//  HourlyLineChart.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 30/10/2023.
//

import Charts
import SwiftUI
import WeatherKit

struct HourlyLineChart<Value: Plottable>: View {
    let forecast: [HourWeather]
    let yLabel: LocalizedStringKey
    let yData: KeyPath<HourWeather, Value>

    var body: some View {
        Chart(forecast) { data in
            LineMark(
                x: .value("Hour", data.date.formatted(.dateTime.hour())),
                y: .value(yLabel, data[keyPath: yData])
            )
            .lineStyle(StrokeStyle(lineWidth: 16))
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
    HourlyLineChart(forecast: [], yLabel: "Humidity", yData: \.humidity)
}
