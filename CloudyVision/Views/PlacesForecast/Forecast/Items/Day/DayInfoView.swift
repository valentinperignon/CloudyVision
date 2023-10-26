//
//  DayInfoView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 26/10/2023.
//

import CVCore
import SwiftUI
import WeatherKit

struct DayInfoView: View {
    let dayWeather: DayWeather

    var body: some View {
        Grid {
            GridRow {
                DayInfoCell(symbolName: "thermometer.low", label: "Low Temp.", value: Constants.formattedTemperature(dayWeather.lowTemperature))
                DayInfoCell(symbolName: "thermometer.high", label: "High Temp.", value: Constants.formattedTemperature(dayWeather.highTemperature))
            }
            Divider()
            GridRow {
                DayInfoCell(symbolName: "drop", label: "Prep. Chances", value: dayWeather.precipitationChance.formatted(.percent))
                DayInfoCell(symbolName: "umbrella", label: "Prep. Amount", value: Constants.formattedAmount(dayWeather.precipitationAmount))
            }
            Divider()
            GridRow {
                DayInfoCell(symbolName: "wind", label: "Wind", value: Constants.formattedSpeed(dayWeather.wind.speed))
                DayInfoCell(symbolName: dayWeather.moon.phase.symbolName, label: "Moon", value: dayWeather.moon.phase.description)
            }
        }

    }
}
