//
//  WeatherData.swift
//
//
//  Created by Valentin Perignon on 22/10/2023.
//

import Foundation
import WeatherKit

public extension WeatherData {
    typealias Temperature = Measurement<UnitTemperature>

    private static let validityPeriod: TimeInterval = 3_600
}

public struct WeatherData: Codable {
    public var lastFetchDate: Date

    public var currentWeather: CurrentWeather
    public var hourlyForecast: Forecast<HourWeather>
    public var dailyForecast: Forecast<DayWeather>

    public var today: DayWeather {
        return dailyForecast.first!
    }

    public var isInvalid: Bool {
        lastFetchDate.timeIntervalSince(.now) > Self.validityPeriod
    }

    public init(currentWeather: CurrentWeather, hourlyForecast: Forecast<HourWeather>, dailyForecast: Forecast<DayWeather>) {
        lastFetchDate = .now

        self.currentWeather = currentWeather
        self.hourlyForecast = hourlyForecast
        self.dailyForecast = dailyForecast
    }
}
