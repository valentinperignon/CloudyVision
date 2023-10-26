//
//  DayWeatherView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 24/10/2023.
//

import SwiftUI
import WeatherKit

struct DayWeatherView: View {
    let dayWeather: DayWeather

    var body: some View {
        HStack {
            if Calendar.current.isDateInToday(dayWeather.date) {
                Text("Today")
            } else {
                Text(dayWeather.date, format: .dateTime.weekday(.abbreviated))
            }

            Spacer()

            WeatherSymbolView(symbolName: dayWeather.symbolName)

            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
