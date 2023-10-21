//
//  LocationManager.swift
//
//
//  Created by Valentin Perignon on 09/09/2023.
//

import CoreLocation
import Foundation
import OSLog
import SwiftUI

@Observable
final public class LocationManager: NSObject {
    private let manager = CLLocationManager()

    public var status = CLAuthorizationStatus.notDetermined
    public var currentPlace: Place?

    public override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
    }

    public func requestAuthorization() {
        manager.requestWhenInUseAuthorization()
    }

    public func requestLocationIfPossible() {
        guard manager.authorizationStatus == .authorizedWhenInUse else { return }
        manager.requestLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        status = manager.authorizationStatus
        requestLocationIfPossible()
    }

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        Task {
            guard let location = locations.first else { return }
            let place = try await Place(location: location, isCurrentLocation: true)
            withAnimation {
                currentPlace = place
            }
        }
    }

    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Logger.locationManager.error("\(error.localizedDescription)")
    }
}
