//
//  OSLog+Categories.swift
//
//
//  Created by Valentin Perignon on 09/10/2023.
//

import OSLog

public extension Logger {
    private static let subsystem = Bundle.main.bundleIdentifier!

    static let locationManager = Logger(subsystem: subsystem, category: "locationManager")
    static let placesForecast = Logger(subsystem: subsystem, category: "placesForecast")
}
