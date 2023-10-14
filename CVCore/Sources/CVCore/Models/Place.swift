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
    public var id: Int { coordinate.hashValue }
    public let name: String
    public let coordinate: Coordinate

    public init(name: String, coordinate: Coordinate) {
        self.name = name
        self.coordinate = coordinate
    }

    public convenience init(location: CLLocation) {
        self.init(name: "From CLLocation", coordinate: Coordinate(from: location))
    }
}
