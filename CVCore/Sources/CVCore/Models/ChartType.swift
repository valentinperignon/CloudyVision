//
//  ChartType.swift
//
//
//  Created by Valentin Perignon on 30/10/2023.
//

import Charts
import Foundation
import SwiftUI
import WeatherKit

public enum ChartType: Codable, Hashable {
    case feelsLike, precipitations, uvIndex, humidity, visibility

    public var title: LocalizedStringKey {
        switch self {
        case .feelsLike:
            return "Temperature felt"
        case .precipitations:
            return "Precipitation"
        case .uvIndex:
            return "UV Index"
        case .humidity:
            return "Humitidy"
        case .visibility:
            return "Visibility"
        }
    }
}
