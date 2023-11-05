//
//  DayInfoView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 26/10/2023.
//

import CoreVisionKit
import SwiftUI
import WeatherKit

struct DayInfoView: View {
    let dayWeather: DayWeather

    var body: some View {
        HStack {
            DayInfoCell(symbolName: "thermometer.low", label: "Low", value: Constants.formattedTemperature(dayWeather.lowTemperature))
            DayInfoCell(symbolName: "thermometer.high", label: "High", value: Constants.formattedTemperature(dayWeather.highTemperature))
            DayInfoCell(symbolName: "wind", label: "Wind", value: Constants.formattedSpeed(dayWeather.wind.speed))
            if let sunset = dayWeather.sun.sunset {
                DayInfoCell(symbolName: "sunset.fill", label: "Sunset", value: sunset.formatted(date: .omitted, time: .shortened))
            }
        }
    }
}
