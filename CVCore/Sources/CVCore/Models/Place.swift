//
//  Place.swift
//
//
//  Created by Valentin Perignon on 10/10/2023.
//

import CoreLocation
import Foundation
import MapKit
import WeatherKit

@Observable
public final class Place: Identifiable {
    public let name: String
    public var coordinates: Coordinates?

    public var weather: WeatherData?

    public var isCurrentLocation = false

    public var iconName: String {
        if isCurrentLocation {
            return "location"
        }
        return "building.2"
    }

    public init(name: String, coordinate: Coordinates? = nil, isCurrentLocation: Bool = false) {
        self.name = name
        self.coordinates = coordinate
        self.isCurrentLocation = isCurrentLocation
    }

    public convenience init(location: CLLocation, isCurrentLocation: Bool = false) async throws {
        let geocoder = CLGeocoder()
        let placemarks = try await geocoder.reverseGeocodeLocation(location)
        guard let name = placemarks.first(where: { $0.name != nil })?.name else {
            throw CVError.geocoderError
        }

        self.init(name: name, coordinate: Coordinates(from: location), isCurrentLocation: isCurrentLocation)
    }

    public convenience init(from searchResult: MKLocalSearchCompletion) {
        self.init(name: searchResult.title)
    }

    public func fetchCoordinate() async throws {
        let geocoder = CLGeocoder()
        let placemarks = try await geocoder.geocodeAddressString(name)
        guard let location = placemarks.first(where: { $0.location != nil })?.location else {
            throw CVError.geocoderError
        }

        coordinates = Coordinates(from: location)
    }
}

extension Place: Equatable {
    public static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.id == rhs.id
    }
}

extension Place: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(coordinates)
        hasher.combine(isCurrentLocation)
    }
}

extension Place {
    public static let allPlaces: [Place] = [.appleCampus]

    public static let appleCampus = Place(name: "Apple Park", coordinate: Coordinates(from: CLLocation(latitude: 37.33, longitude: -122.01)))
}
