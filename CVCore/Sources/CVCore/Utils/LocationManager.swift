//
//  LocationManager.swift
//
//
//  Created by Valentin Perignon on 09/09/2023.
//

import CoreLocation
import Foundation

@Observable
final public class LocationManager: NSObject {
    private(set) var manager = CLLocationManager()

    public var status = CLAuthorizationStatus.notDetermined

    public override init() {
        super.init()
        manager.delegate = self
    }

    public func requestAuthorization() {
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        status = manager.authorizationStatus
    }
}
