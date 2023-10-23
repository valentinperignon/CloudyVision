//
//  WeatherManager.swift
//
//
//  Created by Valentin Perignon on 21/10/2023.
//

import Foundation
import WeatherKit

public final class WeatherManager {
    public static let shared = WeatherManager()

    private let service = WeatherService.shared

    public func refreshWeather() async throws {
        let places = Place.allPlaces
        for place in places {
            try await fetchWeather(for: place)
        }
    }

    public func fetchWeather(for place: Place) async throws {
        guard place.weather?.isInvalid != false else { return }
        guard let location = place.coordinates?.transformToCLLocation() else { return }

        let (current, hourly, daily) = try await service.weather(for: location, including: .current, .hourly, .daily)
        place.weather = WeatherData(currentWeather: current, hourlyForecast: hourly, dailyForecast: daily)
    }
}
