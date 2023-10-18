//
//  Place.swift
//
//
//  Created by Valentin Perignon on 10/10/2023.
//

import CoreLocation
import Foundation
import MapKit
import SwiftData

@Model
public final class Place: Identifiable {
    public let name: String
    public var coordinate: Coordinate?

    @Transient
    public var isCurrentLocation = false

    public var iconName: String {
        if isCurrentLocation {
            return "location"
        }
        return "building.2"
    }

    public init(name: String, coordinate: Coordinate? = nil, isCurrentLocation: Bool = false) {
        self.name = name
        self.coordinate = coordinate
        self.isCurrentLocation = isCurrentLocation
    }

    public convenience init(location: CLLocation, isCurrentLocation: Bool = false) async throws {
        let geocoder = CLGeocoder()
        let placemarks = try await geocoder.reverseGeocodeLocation(location)
        guard let name = placemarks.first(where: { $0.name != nil })?.name else {
            throw CVError.geocoderError
        }

        self.init(name: name, coordinate: Coordinate(from: location), isCurrentLocation: isCurrentLocation)
    }

    public convenience init(from searchResult: MKLocalSearchCompletion) {
        var name = "\(searchResult.title) \(searchResult.subtitle)".trimmingCharacters(in: .whitespaces)
        self.init(name: name)
    }

    public func fetchCoordinate() async throws {
        let geocoder = CLGeocoder()
        let placemarks = try await geocoder.geocodeAddressString(name)
        guard let location = placemarks.first(where: { $0.location != nil })?.location else {
            throw CVError.geocoderError
        }

        coordinate = Coordinate(from: location)
    }
}
