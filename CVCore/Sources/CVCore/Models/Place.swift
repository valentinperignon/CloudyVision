//
//  Place.swift
//
//
//  Created by Valentin Perignon on 10/10/2023.
//

import CoreLocation
import Foundation
import SwiftData

@Model
public final class Place: Identifiable {
    @Transient
    public var id: Int { coordinate.hashValue }

    public let name: String
    public let coordinate: Coordinate

    @Transient
    public var isCurrentLocation = false

    public var iconName: String {
        if isCurrentLocation {
            return "location"
        }
        return "building.2"
    }

    public init(name: String, coordinate: Coordinate, isCurrentLocation: Bool = false) {
        self.name = name
        self.coordinate = coordinate
        self.isCurrentLocation = isCurrentLocation
    }

    public convenience init(location: CLLocation, isCurrentLocation: Bool = false) {
        self.init(name: "From CLLocation", coordinate: Coordinate(from: location), isCurrentLocation: isCurrentLocation)
    }
}
