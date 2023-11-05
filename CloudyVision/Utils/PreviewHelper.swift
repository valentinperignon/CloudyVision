//
//  PreviewHelper.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 24/10/2023.
//

import CoreVisionKit
import Foundation

enum PreviewHelper {
    static let temperature = WeatherData.Temperature(value: 20.5, unit: .celsius)
    static let lowTemperature = WeatherData.Temperature(value: 15.3, unit: .celsius)
    static let highTemperature = WeatherData.Temperature(value: 24.5, unit: .celsius)
}
