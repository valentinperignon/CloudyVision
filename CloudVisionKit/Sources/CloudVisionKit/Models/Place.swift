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
        } else if let weatherSymbol = weather?.currentWeather.symbolName{
            return weatherSymbol
        } else {
            return "building.2"
        }
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
    public static let allPlaces: [Place] = [.appleCampus, .paris, .london, .besancon, .geneva, .newYork]

    public static let appleCampus = Place(name: "Apple Park", coordinate: Coordinates(from: CLLocation(latitude: 37.33, longitude: -122.01)))
    public static let paris = Place(name: "Paris", coordinate: Coordinates(from: CLLocation(latitude: 48.85, longitude: 2.29)))
    public static let london = Place(name: "London", coordinate: Coordinates(from: CLLocation(latitude: 51.52, longitude: -0.26)))
    public static let besancon = Place(name: "Besançon", coordinate: Coordinates(from: CLLocation(latitude: 47.26, longitude: 5.92)))
    public static let geneva = Place(name: "Geneva", coordinate: Coordinates(from: CLLocation(latitude: 46.20, longitude: 6.12)))
    public static let newYork = Place(name: "New-York", coordinate: Coordinates(from: CLLocation(latitude: 40.69, longitude: -74.14)))
}
