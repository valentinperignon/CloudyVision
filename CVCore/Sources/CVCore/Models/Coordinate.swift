//
//  Coordinate.swift
//
//
//  Created by Valentin Perignon on 14/10/2023.
//

import CoreLocation
import Foundation
import SwiftData

public struct Coordinate: Codable, Hashable {
    public let latitude: Double
    public let longitude: Double

    public init(from location: CLLocation) {
        latitude = location.coordinate.latitude
        longitude = location.coordinate.longitude
    }

    public func transformToCLLocation() -> CLLocation {
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}
