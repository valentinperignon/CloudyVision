//
//  LocationManager.swift
//
//
//  Created by Valentin Perignon on 09/09/2023.
//

import CoreLocation
import Foundation
import OSLog

@Observable
final public class LocationManager: NSObject {
    private let manager = CLLocationManager()

    public var status = CLAuthorizationStatus.notDetermined
    public var location: CLLocation?

    public override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
    }

    public func requestAuthorization() {
        manager.requestWhenInUseAuthorization()
    }

    public func requestLocation() {
        manager.requestLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        status = manager.authorizationStatus
    }

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first
    }

    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Logger.locationManager.error("\(error.localizedDescription)")
    }
}
