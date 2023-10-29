//
//  Constants.swift
//
//
//  Created by Valentin Perignon on 26/10/2023.
//

import Foundation
import WeatherKit

public enum Constants {
    public static func formattedTemperature(_ temperature: Measurement<UnitTemperature>) -> String {
        return "\(Int(temperature.value))\(temperature.unit.symbol)"
    }

    public static func formattedLength(_ amount: Measurement<UnitLength>) -> String {
        return "\(Int(amount.value)) \(amount.unit.symbol)"
    }

    public static func formattedSpeed(_ speed: Measurement<UnitSpeed>) -> String {
        return "\(Int(speed.value)) \(speed.unit.symbol)"
    }
}
