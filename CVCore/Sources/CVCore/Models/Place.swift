//
//  Place.swift
//
//
//  Created by Valentin Perignon on 10/10/2023.
//

import Foundation
import CoreLocation

public final class Place {
    public let location: CLLocation
    public let name: String

    public init(location: CLLocation, name: String) {
        self.location = location
        self.name = name
    }
}
