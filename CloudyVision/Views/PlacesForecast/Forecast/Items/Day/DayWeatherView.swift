//
//  DayWeatherView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 24/10/2023.
//

import CoreVisionKit
import SwiftUI
import WeatherKit

struct DayWeatherView: View {
    let dayWeather: DayWeather

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                if Calendar.current.isDateInToday(dayWeather.date) {
                    Text("Today")
                } else {
                    Text(dayWeather.date, format: .dateTime.weekday().day().month())
                }
            }
            .font(.headline)
            .padding(.bottom, 4)

            HStack() {
                WeatherSymbolView(symbolName: dayWeather.symbolName)

                Text(dayWeather.condition.description)
                    .foregroundStyle(.secondary)

                if dayWeather.precipitationChance > 0 {
                    Text(dayWeather.precipitationChance, format: .percent)
                        .foregroundStyle(Color.rain)
                        .font(.caption)
                        .bold()
                }
            }
            .padding(.bottom, 24)

            DayInfoView(dayWeather: dayWeather)
        }
        .padding(UIConstants.blocksSpacing)
        .containerRelativeFrame(.horizontal, count: 2, spacing: 48, alignment: .leading)
        .forecastItem()
        .scrollTransition(axis: .horizontal) { content, phase in
            content
                .opacity(phase.isIdentity ? 1 : 0.7)
        }
    }
}
